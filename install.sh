
# Installing Dependencies
echo "Installing Dependencies..."

sudo apt update
sudo apt install git wget openjdk-21-jre -y

# Cloning
git clone https://github.com/marvennsuson/burpsuite.git Burpsuite
cd Burpsuite

# Download Burpsuite Professional Latest.
Link="https://portswigger-cdn.net/burp/releases/download?product=community&version=2025.1.1&type=Jar"
version=2025.1.1

echo "Downloading Burpsuite v$version ..."

wget "$Link" -O burpsuite_pro_v$version.jar --quiet --show-progress


echo "Executing Burpsuite ..."

echo "java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED --add-opens=java.base/jdk.internal.org.objectweb.asm.Opcodes=ALL-UNNAMED -javaagent:$(pwd)/loader.jar -noverify -jar $(pwd)/burpsuite_pro_v$version.jar &" > burpsuitepro
chmod +x burpsuitepro
cp burpsuitepro /bin/burpsuitepro
(./burpsuitepro)