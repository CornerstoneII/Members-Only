module ApplicationHelper
  def check_user_for_post
    link_to 'New Post', new_post_path, class: 'nav-link' if user_signed_in?
  end

  def authentic_user
    if user_signed_in?
      render inline: "Logged in as <strong><%= current_user.email %></strong>.

        <%= link_to 'Logout', destroy_user_session_path, method: :delete, :class => 'navbar-link'  %>"

    else
      render inline: "<%= link_to 'Sign up', new_user_registration_path, :class => 'navbar-link'  %> |
        <%= link_to 'Login', new_user_session_path, :class => 'navbar-link'  %>"
    end
  end

  def anonymous
    if user_signed_in?
      render inline: "<% @posts.each do |post| %>
        <tr>

        <td><strong> <%= post.user.email %></strong></td>
            <td><%= post.title %></td>
            <td><%= post.body %></td>

        </tr>
        <% end %>"

    else
      render inline: "<% @posts.each do |post| %>
      <tr>

      <td><strong> Anonymous</strong></td>
          <td><%= post.title %></td>
          <td><%= post.body %></td>

      </tr>
      <% end %>"
    end
  end
end
