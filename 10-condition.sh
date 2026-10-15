echo "Please enter the marks"
read marks

if [ $marks -lt 33 ]; then
    echo "You have failed the exam"
elif [ $marks -lt 50 ]; then
    echo "Third class"
elif [ $marks -lt 70 ]; then
    echo "Second class"
elif [ $marks -lt 90 ]; then
    echo "First class"
else
    echo "Distinction"
fi

echo "END"

user_id=$(id -u)

if [ $user_id -ne 0 ]; then
    echo "Please run this script as root user"
    exit 1
fi
