echo "=== Проверка четности числа ==="

read -p "Введите число: " number

if (( number % 2 == 0 )); then
    echo "Число $number является ЧЕТНЫМ"
else
    echo "Число $number является НЕЧЕТНЫМ"
fi
