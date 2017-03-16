namespace :feature do
  feature_name "Upgrade cloud via browser UI"


  namespace :ui do
    namespace :upgrade do
      desc "Landing page"
      feature_task :landing, tags: :@landing

      desc "Admin node backup"
      feature_task :"admin:backup", tags: :@admin_backup

      desc "Admin repo checks"
      feature_task :"admin:repos", tags: :@admin_repos

      desc "Admin server upgrade"
      feature_task :"admin:upgrade", tags: :@admin_upgrade

      desc "Create postgresql database"
      feature_task :"pgsql:create", tags: :@pgsql_create

      desc "Nodes repo checks"
      feature_task :"nodes:repos", tags: :@nodes_repos

      desc "Stop Openstack services"
      feature_task :"os-services:stop", tags: :@stop_os_services

      desc "Openstack database backup"
      feature_task :"os-db:backup", tags: :@os_db_backup

      desc "Upgrade of nodes"
      feature_task :"nodes:upgrade", tags: :@nodes_upgrade

      feature_task :all
    end

    desc "Run all upgrade steps"
    task :upgrade => "upgrade:all"
  end
end
