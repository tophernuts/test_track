class Admin::VariantRetirementsController < AuthenticatedAdminController
  def create
    retirement = VariantRetirement.create!(create_params.merge(admin: current_admin))
    flash[:success] = "Retired #{retirement.retiring_variant}"
    redirect_to admin_split_path(retirement.split_id)
  end

  def create_params
    params.permit(:split_id, :variant_id).tap do |params|
      params.merge!(retiring_variant: params[:variant_id]).except!(:variant_id)
    end
  end
end
