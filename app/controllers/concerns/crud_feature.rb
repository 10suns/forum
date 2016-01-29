module CRUDFeature
  extend ActiveSupport::Concern
  included do
    before_action :set_resource, only: [:show, :edit, :update, :destroy]

    def index
      @resources = model_class.all
      render :index
    end

    def new
      @resource = new_resource
    end

    def show
      render :show
    end

    def edit
      render :edit
    end

    def create
      @resource = new_resource(permitted_params)
      if @resource.save
        redirect_to @resource
      else
        render :edit
      end
    end

    def update
      if @resource.update(permitted_params)
        redirect_to @resource
      else
        render :new
      end
    end

    protected

    def namespace
      self.class.name.deconstantize
    end

    def model_class
      if namespace.present?
        "#{namespace}::#{controller_name.classify}".constantize
      else
        "#{controller_name.classify}".constantize
      end
    end

    def new_resource(*args)
      model_class.new(*args)
    end

    def excluded_params
      %w(id create_at updated_at created_by updated_by)
    end

    def permitted_params
      params.require(model_class.name.underscore.split('/').join('_').to_sym).permit(model_class.column_names - excluded_params)
    end

    def set_resource
      @resource = model_class.find(params[:id])
    end
  end
end