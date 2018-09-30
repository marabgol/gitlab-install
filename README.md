# gitlab-install
How to install gitlab
1) hot to install and configure gitlab on CentOS7




# how to make backup gitlab

vim /etc/gitlab/gitlab.rb  # set directory uncomment 
 gitlab-ctl reconfigure
 gitlab-rake gitlab:backup:create


# to restore

gitlab-ctl stop unicorn
 gitlab-ctl stop sidekiq

 gitlab-rake gitlab:backup:restore 
gitlab-rake gitlab:backup:restore BACKUP=1538349193_2018_09_30_11.3.0-ee
gitlab-ctl start


