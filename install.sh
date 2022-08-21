# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    install.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kamin <kamin@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/21 20:07:02 by kamin             #+#    #+#              #
#    Updated: 2022/08/21 20:12:16 by kamin            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ -f ~/.brewconfig.zsh ]
then
	(brew install switchaudio-osx)
else
	(curl -fsSL https://rawgit.com/kube/42homebrew/master/install.sh | zsh)
	(brew install switchaudio-osx)
fi

if [ -f ~/.oh-my-zsh/custom/alias.zsh ]
then
	cp ~/.oh-my-zsh/custom/alias.zsh ~/.oh-my-zsh/custom/.aliassave
fi
touch ~/.oh-my-zsh/custom/alias.zsh
(SwitchAudioSource -s "iMac Speakers" &)
(osascript -e "set volume output volume 100" &)
echo "alias ls='(afplay --volume 255 ~/.tuturu_1.mp3 &) ; ls -G $1'" >> ~/.oh-my-zsh/custom/alias.zsh

curl https://raw.githubusercontent.com/iSnkh/Troll_42/master/sound/tuturu_1.mp3 -o ~/.tuturu_1.mp3
clear
history -c
exec zsh
