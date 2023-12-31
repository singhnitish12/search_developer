class MembersController < ApplicationController
    before_action :authenticate_user!, only: %i[edit_description update_description edit_personal_details update_personal_details]

    def show
        @user = User.find(params[:id])
    end

    def edit_description
        #@user = User.find(params[:id])
    end

    def update_description
        #@user = User.find(params[:id])
        respond_to do |format|
            if current_user.update(about: params[:user][:about])
                format.turbo_stream { render turbo_stream: turbo_stream.replace('member-description', partial: 'members/member_description', locals: { user: current_user }) }
            end
        end
    end

    def edit_personal_details

    end

    def update_personal_details
        respond_to do |format|
            if current_user.update(user_personal_info_params)
                format.turbo_stream { render turbo_stream: turbo_stream.replace('member-personal-details', partial: 'members/member_personal_details', locals: { user: current_user }) }
            end
        end
    end

    private

    def user_personal_info_params
        params.require(:user).permit(:first_name, :last_name, :city, :state, :country, :pincode, :profile_title)
    end
end