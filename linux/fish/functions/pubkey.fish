function pubkey
    if test -f ~/.ssh/id_rsa.pub
        cat ~/.ssh/id_rsa.pub | xsel --clipboard; and echo '=> Public key copied to clipboard.'
    else if test -f ~/.ssh/id_ed25519.pub
        cat ~/.ssh/id_ed25519.pub | xsel --clipboard; and echo '=> Public key copied to clipboard.'
    else
        echo 'No public key found.'
    end
end