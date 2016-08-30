Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AKIAJ2K6HRI6IXNCEVZQ'], ENV['O8HGiGDC4QsMAWRikSttIeZTDj1LdleiXQb+R2Aq']),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['123delivery12'])
