module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the "([^\"]*)" ticket in the "([^\"]*)" project/
      project_ticket_path(project($2), Ticket.find_by_title!($1))
    when /the project page for "([^\"]*)"/
      project_path(project($1))
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end

  def project(name)
    Project.find_by_name!(name)
  end

end

World(NavigationHelpers)
