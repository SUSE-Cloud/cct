module Cct
  module Commands
    module Openstack
      class Image < Command
        self.command = ["image"]

        def list *options
          super(options << columns(
            Struct.new(:id, :name, :status)
          ))
        end

        def create name, options={}
          super do |params|
            # mandatory params
            params.add container_format: "--container-format"
            params.add disk_format:      "--disk-format"

            # optional params
            params.add :optional, file: "--file"
            params.add :optional, public: "--public", param_type: :switch
            params.add :optional, private: "--private", param_type: :switch

            # properties: will be transformed into --property hypervisor_type=kvm
            params.add :property, hypervisor_type: "hypervisor_type"
            params.add :property, vm_mode: "vm_mode"

            # fallback to all properties defined at once
            params.add :properties, param_type: :properties
          end
        end

      end
    end
  end
end
