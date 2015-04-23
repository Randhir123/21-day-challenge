#!/usr/env/ruby
#  Creating a personal directory for the 21-day-challange
require 'optparse'

class Challenge
  def create_dir(path)
    IO.popen("mkdir #{path}")
  end

  def retrieve_user_name
    options = {:user_name => nil}

    parser = OptionParser.new do|opts|
      opts.banner = "Usage: create_personal_directory.rb [options]"
      opts.on('-u', '--user user', 'The user name you want to use during the challange') do |user_name|
        options[:user_name] = user_name;
      end

      opts.on('-h', '--help', 'Displays Help') do
        puts opts
        exit
      end
    end

    parser.parse!

    puts options[:user_name]
    options[:user_name] || 'liamseanbrady'
  end

  def create_dirs_and_readme_for_user(user_name)
    first_adventure_label = "01_day1"
    readme_text = "# Adventure 01
    This script creates:
    - a directory with the username,
    - a directory for the 1st exercise within the user's personal directory,
    - the README-file you're reading
    "

    personal_dir_path = File.join(Dir.pwd, user_name)
    create_dir personal_dir_path

    first_adventure_dir_path = File.join(personal_dir_path, first_adventure_label)
    create_dir first_adventure_dir_path

    readme_path = File.join(first_adventure_dir_path,"README.md")
    File.open(readme_path,"w"){|file|
      file.write(readme_text)
    }
    puts "Created README: #{readme_path}"
  end

  def main
    user_name = retrieve_user_name
    create_dirs_and_readme_for_user user_name
  end
end
