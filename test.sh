
pkg install -y proot wget
mkdir ~/ubuntu_directory
cd ~/ubuntu_directory

wget https://raw.githubusercontent.com/Neo-Oli/termux-ubuntu/master/ubuntu.sh
sed -i 's/disco/focal/g' ubuntu.sh
bash ubuntu.sh

sed -i 's/#command+=" -b \/data/command+=" -b \/data/g' start-ubuntu.sh

#termux-setup-storage
#mkdir ~/storage/shared/Geyser/
#ln -s ~/storage/shared/Geyser/ ~/Geyser

mkdir ~/Geyser/
cd ~/Geyser/

wget https://ci.nukkitx.com/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/target/Geyser.jar

cd ~

cat >.profile <<EOM
apt update
apt install -y default-jre

echo
echo Geyser has been installed!
#echo You can access the config file using your phones file manager, there should be a folder called 'Geyser'.
echo You can now start Geyser at any time using
echo ./ubuntu_directory/start-ubuntu.sh
echo cd Geyser
echo java -jar Geyser.jar

rm -rf .profile

exit
EOM

./ubuntu_directory/start-ubuntu.sh
