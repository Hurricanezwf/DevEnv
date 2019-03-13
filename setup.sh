#!/bin/sh

tmpdir="$HOME/.tmp"


# 新建临时目录
if [ ! -e $file ]
then
	echo "$tmpdir exist! so create it"
	mkdir $tmpdir
fi
cd $tmpdir


# 安装前置软件
#sudo yum -y install git ctags tmux zsh openssh-server
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
git clone http://github.com/Hurricanezwf/DevEnv.git
echo -e "\033[33mInstall pre-software done, please ensure all is installed success!\033[0m"
echo "Press enter to next step or Ctrl+C to quit!"
read



# 切换shell环境到zsh,安装oh-my-zsh
sudo chsh -s /bin/zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"


# 安装Golang
wget  https://storage.googleapis.com/golang/go1.7.1.linux-amd64.tar.gz
sudo tar -C /usr/local/ -zxf go1.7.1.linux-amd64.tar.gz


# 将配置文件用已有的模板进行替换
cd ./DevEnv
cp gitconfig $HOME/.gitconfig
cp tmux.conf $HOME/.tmux.conf
cp vimrc $HOME/.vimrc
cp zshrc $HOME/.zshrc




# something you need to do by self
echo -e "\033[33msomething you need to do you self:"
echo "(1) add /usr/local/go/bin to ENVIRONMENT PATH"
echo "(2) mkdir $HOME/GoProj"
echo "(3) enter .vimrc by vim and execute :PluginInstall to install plugins by vundle"
echo "(4) fix vim-go: enter .vimrc and then execute :GoInstallBinaries"



# 配置snippets
# snippets文件编写参照: https://vimzijun.net/2016/10/30/ultisnip/
# 官方文档: https://github.com/SirVer/ultisnips/blob/master/doc/UltiSnips.txt
(1) 在自定义目录下新建UltiSnips目录, 然后编写snippets文件
(2) 修改.vimrc中的snippets配置, 使其搜索路径指向上一步自定义目录
