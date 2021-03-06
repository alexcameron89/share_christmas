ActiveAdmin.register OrganizationCampaign do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :organization_id, :campaign_id, :reminder_date,
                :donation_deadline, :description
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form html: { enctype: 'multipart/form-data' } do |f|
    f.inputs 'Details' do
      f.input :organization
      f.input :campaign
      f.input :reminder_date
      f.input :donation_deadline
      f.input :description, label: 'Description', input_html: { class: 'tinymce' }
    end

    f.actions
  end

  index do
    selectable_column
    id_column
    column :created_at
    column :organization
    column :campaign
    column :reminder_date
    column :donation_deadline
    html_column :description
    actions
  end

  show do |_organization_campaign|
    attributes_table do
      row :created_at
      row :organization
      row :campaign
      row :reminder_date
      row :donation_deadline
      html_row :description
    end
  end
end
