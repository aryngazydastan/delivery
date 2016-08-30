class ArticlesController < ApplicationController
	def index
	    @articles = Article.all
	end

	def show
	    @article = Article.find(params[:id])

	end	

	def new
	end

	def create
		@article = Article.new(article_params)
		@article.save

		redirect_to @article
	end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	 
	  redirect_to articles_path
	end

	def update
		@article = Article.find(params[:id])
	 
	    if @article.update(article_params)
	      redirect_to @article
	    else
	      render 'edit'
	    end
	end

	private
	  def article_params
	    params.require(:article).permit(:title, :text, :city_id)
	  end	

	  def set_s3_direct_post
	    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
	  end

end
