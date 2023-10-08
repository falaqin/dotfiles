function cpdir --description 'Copy current directory to clipboard'
  command pwd | tr -d '\n' | xsel --clipboard; and echo 'Copied';
end