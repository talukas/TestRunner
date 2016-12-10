GITHUB_ACCOUNT=talukas
WS_DIR=Workspace
REPO_NAME=Valid_Title_End2End
APP_VERSION=1.1
MAIN_CLASS=A2d
ARGS_01=

if which java >/dev/null 2>&1 ; then java -version &>jv.txt;grep "java version" jv.txt | awk '{print $1,$3}'; else echo Java not installed; return; fi
if which mvn >/dev/null 2>&1 ; then mvn --version &>mv.txt; grep "Apache Maven" mv.txt | awk '{print $2,$3}'; else echo Maven not installed; return; fi
if which git >/dev/null 2>&1 ; then git --version &>gv.txt; grep "git version" gv.txt | awk '{print $1,$3}'; else echo Git not instlled; return; fi

if [ -d "$HOME/$WS_DIR" ] ; then cd ~/$WS_DIR; else echo $WS_DIR directory is not exist; return; fi

if [ -d "$HOME/$WS_DIR/$REPO_NAME" ]; then rm -rf $HOME/$WS_DIR/$REPO_NAME; fi

git clone https://github.com/$GITHUB_ACCOUNT/$REPO_NAME

cd ./$REPO_NAME

mvn package
echo "Executing Java programm ..."
java -jar $HOME/$WS_DIR/$REPO_NAME/target/$REPO_NAME-$APP_VERSION-jar-with-dependencies.jar 
