class User < ActiveRecord::Base
  #email都存储为小写字母
  before_save{self.email = email.downcase}

  #validates 是一个方法validates()
  #用户不能为空
  validates :name,presence:true,length:{maximum:50}

  #邮箱正则表达/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,presence:true,format:{with:VALID_EMAIL_REGEX},
  uniqueness:{case_sensitive:false}

  has_secure_password
  validates :password,length:{minimum:6}
end
