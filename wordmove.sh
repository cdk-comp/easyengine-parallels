# Rubygems update

if [ $(gem -v|grep '^2.') ]; then
	echo "gem installed"
else
	sudo apt-add-repository ppa:brightbox/ruby-ng -y
	sudo apt-get update
	sudo apt-get install ruby2.4 ruby2.4-dev -y
fi

# wordmove install
wordmove_install="$(gem list wordmove -i)"
if [ "$wordmove_install" = true ]; then
  echo "wordmove installed"
else
  echo "wordmove not installed"
  sudo gem install wordmove
  wordmove_path="$(gem which wordmove | sed -s 's/.rb/\/deployer\/base.rb/')"
  if [  "$(grep yaml $wordmove_path)" ]; then
    echo "can require yaml"
  else
    echo "can't require yaml"
    echo "set require yaml"
    sed -i "7i require\ \'yaml\'" $wordmove_path
    echo "can require yaml"
  fi
fi
