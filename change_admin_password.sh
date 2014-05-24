#!/bin/bash

set -e

if [ -f /.glassfish_admin_password_changed ]; then
    echo "Glassfish 'admin' password already changed!"
    exit 0
fi

#generate pasword
PASS=${GLASSFISH_PASS:-$(pwgen -s 12 1)}
_word=$( [${GLASSFISH_PASS} ] && echo "preset" || echo "random" )

echo "=> Modifying password of admin to ${_word} in Glassfish"
/change_admin_password_func.sh $PASS
echo "=> Enabling secure admin login"
/enable_secure_admin.sh $PASS
echo "=> Done!"  
touch /.glassfish_admin_password_changed
    
echo "========================================================================"
echo "You can now connect to this Glassfish server using:"
echo ""
echo "     admin:$PASS"
echo ""
echo "Please remember to change the above password as soon as possible!"
echo "========================================================================"
