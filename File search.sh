echo "=== Поиск файлов по расширению ==="
read -p "Введите расширение файла (например: txt, pdf, jpg): " ext

# Проверка ввода
if [ -z "$ext" ]; then
    echo "Ошибка: не указано расширение"
    exit 1
fi

# Поиск файлов
files=($(find . -maxdepth 1 -name "*.$ext" -type f 2>/dev/null))

if [ ${#files[@]} -eq 0 ]; then
    echo "Файлов с расширением .$ext не найдено"
    exit 0
fi

echo ""
echo "Найдено файлов: ${#files[@]}"
echo "================================"

# Вывод информации о файлах
counter=1
for file in "${files[@]}"; do
    filename=$(basename "$file")
    size=$(stat -c%s "$file" 2>/dev/null || stat -f%z "$file" 2>/dev/null)
    human_size=$(numfmt --to=iec --suffix=B $size 2>/dev/null || echo "${size}B")
    mod_date=$(stat -c%y "$file" 2>/dev/null | cut -d' ' -f1)
    
    printf "%3d. %-30s | Размер: %-10s | Дата: %s\n" \
        "$counter" "$filename" "$human_size" "$mod_date"
    ((counter++))
done
