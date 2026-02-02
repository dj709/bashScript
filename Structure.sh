echo "=== СОЗДАНИЕ СТРУКТУРЫ ВЕБ-ПРОЕКТА ==="

read -p "Введите имя проекта: " project_name
if [ -d "$project_name" ]; then
    echo "Ошибка: Папка '$project_name' уже существует!"
    exit 1
fi

echo "Создаю папку проекта: $project_name"
mkdir -p "$project_name"

# Переходим в папку проекта
cd "$project_name" || exit

# Создаем стандартную структуру папок
echo "Создаю структуру папок..."

# Основные папки
mkdir -p css js images fonts
mkdir -p docs          # Документация
mkdir -p backup        # Резервные копии
mkdir -p vendor        # Сторонние библиотеки
echo " Основные папки созданы"
