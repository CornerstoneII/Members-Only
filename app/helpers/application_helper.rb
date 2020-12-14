module ApplicationHelper
  def check_user_for_post
    link_to 'New Post', new_post_path, class: 'nav-link' if user_signed_in?
  end
end
