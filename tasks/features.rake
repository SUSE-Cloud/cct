namespace :features do
  desc "Run basic tests for cloud"
  task :base do
    invoke_task "feature:admin"
    invoke_task "feature:controller"
    invoke_task "feature:users"
    invoke_task "feature:images"
    invoke_task "features:barclamps"
    invoke_task "feature:migration:kvm"
  end

  desc "Run basic tests for cloud with xen computes"
  task :base_xen do
    invoke_task "feature:admin"
    invoke_task "feature:controller"
    invoke_task "feature:users"
    invoke_task "feature:images"
    invoke_task "features:barclamps"
    invoke_task "feature:migration:xen"
  end
  desc "Run functional client tests"
  task :functional do
    invoke_task "test:func:all"
  end

  desc "Run barclamp tests"
  task :barclamps do
    invoke_task "feature:barclamp:rabbitmq"
  end
end
