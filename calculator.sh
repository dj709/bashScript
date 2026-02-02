echo "=== Калькулятор суммы ==="

echo -n "Введите первое число: "
read num1
echo -n "Введите второе число: "
read num2

sum=$((num1 + num2))
echo "Сумма: $num1 + $num2 = $sum"
