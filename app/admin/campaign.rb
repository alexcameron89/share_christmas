ActiveAdmin.register Campaign do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :volunteer_center_id, :description, :donation_deadline,
    :reminder_date, :logo
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :volunteer_center
      f.input :name
      f.input :description
      f.input :donation_deadline
      f.input :reminder_date
      f.input :logo, :as => :file, :hint => f.object.logo? ? image_tag(f.object.logo.url(:medium)) : content_tag(:span, 'Upload a PNG')
    end

    f.actions
  end
end
