function www --description "Change directory to apache's HTML"
    
    set html_dir "/var/www/html/"
    set index 1
    set available_dirs
    
    # List available directories
    echo "Available directories:"
    echo "0. $html_dir"
    for dir in $html_dir/*
        if test -d $dir
            set dir_name (basename $dir)
            set available_dirs $available_dirs $dir_name
            echo "$index. $dir_name"
            set index (math $index + 1)
        end
    end

    # Ask user to choose a directory by number
    read -l -p "set_color brcyan; echo '🔴 Enter the number of the directory you want to go to. ' ; set_color normal; echo '> '" choice

    # If user unexpectedly closed the command or entered a null
    if test -z "$choice"
        set user (whoami)
        
        set_color brcyan
        echo "I know who you are, $user."
        return 1
    end

    # Check whether input is integer or string
    if string match -qr --invert '^-?[0-9]+$' $choice
        echo "The input is not an integer. Are you retarded?"
        return 1
    end

    # Check if the choice is within valid range
    if test $choice -ge 0 -a $choice -le (count $available_dirs)

        if test $choice -eq 0
            cd $html_dir || exit
            echo "Navigated to $html_dir"
            return
        else
            set chosen_dir $available_dirs[$choice]
            set chosen_path "$html_dir$chosen_dir"
            cd $chosen_path || exit
            echo "Navigated to $chosen_path"
            return 1
        end

    else
        echo "Invalid choice"
        return 1
    end

end