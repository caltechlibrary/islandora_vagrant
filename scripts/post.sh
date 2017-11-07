#!/bin/bash

# Setup a user for Tomcat Manager
sed -i '$i<role rolename="admin-gui"/>' /etc/tomcat7/tomcat-users.xml
sed -i '$i<user username="islandora" password="islandora" roles="manager-gui,admin-gui"/>' /etc/tomcat7/tomcat-users.xml
service tomcat7 restart

# Set correct permissions on sites/default/files
chmod -R 775 /var/www/drupal/sites/default/files

# Allow anonymous & authenticated users to view repository objects
drush --root=/var/www/drupal role-add-perm "anonymous user" "view fedora repository objects"
drush --root=/var/www/drupal role-add-perm "authenticated user" "view fedora repository objects"
drush --root=/var/www/drupal cc all

# Lets brand this a bit

cat <<'EOT' >> /home/vagrant/.bashrc
echo '   __________   ___   _  _____  ____  ___  ___     '
echo '  /  _/ __/ /  / _ | / |/ / _ \/ __ \/ _ \/ _ |    '
echo ' _/ /_\ \/ /__/ __ |/    / // / /_/ / , _/ __ |    '
echo '/___/___/____/_/ |_/_/|_/____/\____/_/|_/_/ |_| '
echo ''
echo ' ____              ___      ______ '
echo '/_  /__ __  ____  <  /     <  / _ \'
echo ' / _ \ \ / /___/  / / _    / / // /'
echo '/_(_/_\_\        /_/ (_)  /_/\___/ '
echo ''
echo '                                               `,,:;..+.+:;+                                        '
echo '                                            ;+.+.#.#+++#@#+.+.                                      '
echo '                                        .;++...++....+++++###.++:                                   '
echo '                                   `++++##++######++.+.+++.+++####+.                                '
echo '                                 :++++#@;:.:;..+.####+#++++++++++#+++++.+#+##+#+..`                 '
echo '                              +++++.+.;++##@@@+..;+;..+.+++++#.++..+++.+###########++               '
echo '                          ``.+....+;++++++++###++@@.;+..+.+...+.#.......+++++#######++#+.           '
echo '                         .++++.+:;#.;..;+++#####;:.@@#++;......+++..;........++++#####+#@##         '
echo '                       ,;+#.....+.;;;.+++#+###@###@#@###..;;.+.+++#++#++.....++++++@#########.      '
echo '                      :++.....++.#;+.;;;;...++++##++##+++++.++++...+++##+....++++#+++#########:     '
echo '                    .++......++.+#.+;;;;...;;...+++++.;;;;...+++..+.++##+..+++++++#++#+######+      '
echo '                  .#+#+....++....#.@;;;:;;;.;....##..;;;..++++.++++......++++++##+####+#@+:,;:      '
echo '               `,+++...;.;.;+++++#++;;;;;:;;;....;;;;;.............++++++++#++###+#+#.;`,,,,:       '
echo '             ,++#+.....++;...@+##+.;;;;;;;;.;;;;;;;................+.+++++++++@@;;:,`,,;,::         '
echo '        ..##+++....++..+....;+###+;;:;;;;;.;;;;;.;..++++##@.;@.@@@+:.:, `;;,.; ,,.,: .:..           '
echo ',:;+##########++...;......;...;.+.;;;;;;;;;;;;;...++@##@.@@#@;@@@@;`,`   :,`,.; `;                  '
echo '#########+++.+....+;;.+++..;..;;+..+..;;;;;.....+#@#+++++@@@@+#@@@+                                 '
echo '++#+++##++...;.;.+#.;;.#+....+.;++++;....+.+++##@+++++++#@@@@@+@@@@:                                '
echo '++++++++++..;;;;;;.@.;;.#+.;..+..+@+#..;.;...+#++++++++++@@@#@+#@@@@@@#+,                           '
echo '++.+++++++.;;;;;;;.+++;;.#.;..++.+#@+#...;;;....+####+##++###@#+##++.++##+;                         '
echo '....++++++.;;;;;;;.+++;;.++..#+##+##@+......;...;.;;;;;....#@@.:###++...+#++.:;                     '
echo '....+++++#.;;;;;;;.#+++.;.#+.#++@.:;.##++++..........;;;;........+###+++.+#++..;,: :                '
echo '......+++#.+..;;;...++#..+++++##.+:@.;.@#+++..+.+..+....;...........++++#+++#+##...,;`              '
echo '.......++#++..;;.;;..+#+#++@##++.;...#.;.+++++........................+#::;#++....#..;:.,,`         '
echo '......++++#+...;....+##+#+#.+..+;;;..;..+.+++++..+......................+#.;@,@:++####+.,.,::       '
echo '.......++.++....+++++..++.+.;;..;;:;..;....;@##+++....+...........++......++#..#,;@,@:@:@;#,#.      '
echo '+.......+++++.......++++;+;;;:;.:.;;.+.+..+++;,#+++++..++++..+.+.++++..........+#+++++.+.+#@##`     '
echo '++........+++......++++.;;.;;::..:.;..#.++;      ,@##+############++#+####+++++++++#########@#,     '
echo '............+.+...++++++.;;+;::..;;+++++@+;          `.::,,:;::,...,:.+##+...###++######@@##@.      '
echo '...+++.............+++#.:::.+.;:+;;.+++##;                                      ;@######@#+.        '
echo '......+.............+++@.;;:.+#.:+...+@#                                                            '
echo '......+..............++.;+##+.++..+++#;                                                             '
echo '+.....+..;;;;;...+...:;..;;...+...##.                                                               '
echo '+..+..+.+...;;...++.::::;;;+.++;+##                                                                 '
echo '++.;;;;;;+.;;;..+.#+.+;::+....#;++.                                                                 '
echo ':::;;:;.+.;;...+##+#++...;;;.;+;#+,                                                                 '
echo ';;::;.#.++..++###++#.++..;;.....+.                                                                  '
echo '...+#.....+++###+...;+.;.;;.++.+#                                                                   '
echo '.+#.....+#+#@#+......;.+..+.+++                                                                     '
echo '++..+++#+@#++.+++...++++.+##@##,                                                                    '
echo '.+#+;..:,.#++.++++++++@@: `#@++++#.`                                                                '
echo '++++@..+.,.###++++###`       ;+#;@+.                                                                '
echo '+++++##..#..#@####.           :.#`                                                                  '
echo '########@..#++`               .++;                                                                  '
echo '...;::,.` ;+.+++#:             #.                                                                   '
echo '           `;+@#+++++.+#                                                                            '
echo '               ,#+#.`                                                                               '
echo '                 :@+....+,                                                                          '

EOT
