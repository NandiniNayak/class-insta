<h4 class="shade-grey">Discover people</h4>
<!-- profile picture, name and follow button in a card -->
<div class="row">
  <% @users.each do |user| %>
   <% if(user != current_user) %>
    <div class="col-md-4">
       <!-- if current user is already following -->
       <div class="card">
         <!-- only the users who are not a current user  -->
           <%= image_tag(user.profile.picture_url, class: "profile-follow-pic") %>
           <span class="follow-profile-name"><%= user.profile.name %></span>
           <!-- if user.followings is an empty array, provide a link to follow -->
           <!-- check if the user is already been followed by current user, by parsings throught he array of users followers -->
            <% if user.followers.include?(current_user) %>
               <a href="#" class="btn btn-danger follow"> following </a>
            <% else %>
             <%= link_to 'follow', followings_path(:follower_id => user), method: :post, class: "btn btn-primary follow"%>
            <% end %>
       </div>
    </div>
    <% end %>
  <% end %>
  <br><br>
</div>
<br><br><br>
<% if current_user.followings %>
  <h4 class="shade-grey">Profiles followed by <%= current_user.profile.name %></h4>
  <ul>
    <% current_user.followings.each do |following|  %>
    <li><%= following.followee.profile.name %>
    <%= link_to 'unfollow', following, method: :delete %></li>
    <% end %>
  </ul>

  <br><br><br>
  <h4 class="shade-grey">Profiles following <%= current_user.profile.name %></h4>
  <ul>
    <% current_user.followers.each do |follower|  %>
    <li><%=follower.profile.name %></li>
    <% end %>
  </ul>
<% end %>
