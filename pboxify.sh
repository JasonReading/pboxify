#!/bin/bash
pboxify(){

    # Check for .protobox.yml
    if [ ! -f ".protobox.yml" ]; then
        # Whoops!
        echo "File .protobox.yml does not exist"
        exit 1
    fi

    # Check for protobox folder
    if [ ! -d "protobox" ]; then
        # Grab protobox
        git clone https://github.com/protobox/protobox protobox
    fi

    # End if the protobox folder still doesn't exist
    if [ ! -d "protobox" ]; then
        # Failed
        echo "Failed to create/copy protobox folder"
        exit 1
    fi

    # Copy .protobox.yml to the appropriate folder
    cp ./.protobox.yml protobox/data/config/common.yml

    # Copy pbox proxy to main folder
    echo "#!/bin/sh" > pbox
    echo "cd protobox; vagrant \"\$@\"; cd .." >> pbox
    chmod +x pbox
}
