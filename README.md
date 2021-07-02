![GitHub Workflow Status](https://img.shields.io/github/workflow/status/a-rotari/yamdb_final/yamdb-workflow)

# Проект YaMDb

Проект YaMDb собирает отзывы (Review) пользователей на произведения (Title). Произведения делятся на категории: «Книги», «Фильмы», «Музыка». Список категорий (Category) может быть расширен (например, можно добавить категорию «Изобразительное искусство» или «Ювелирка»).
Сами произведения в YaMDb не хранятся, здесь нельзя посмотреть фильм или послушать музыку.
В каждой категории есть произведения: книги, фильмы или музыка. Например, в категории «Книги» могут быть произведения «Винни Пух и все-все-все» и «Марсианские хроники», а в категории «Музыка» — песня «Давеча» группы «Насекомые» и вторая сюита Баха. Произведению может быть присвоен жанр из списка предустановленных (например, «Сказка», «Рок» или «Артхаус»). Новые жанры может создавать только администратор.
Благодарные или возмущённые читатели оставляют к произведениям текстовые отзывы (Review) и выставляют произведению рейтинг (оценку в диапазоне от одного до десяти). Из множества оценок автоматически высчитывается средняя оценка произведения.

# Алгоритм регистрации пользователей

Пользователь отправляет POST-запрос с параметром email на `/api/v1/auth/email/`.
YaMDB отправляет письмо с кодом подтверждения (confirmation_code) на адрес email.
Пользователь отправляет POST-запрос с параметрами email и confirmation_code на `/api/v1/auth/token/`, в ответе на запрос ему приходит token (JWT-токен).
Эти операции выполняются один раз, при регистрации пользователя. В результате пользователь получает токен и может работать с API, отправляя этот токен в заголвке с каждым запросом.

# Пользовательские роли

**Аноним** — может просматривать описания произведений, читать отзывы и комментарии.

**Аутентифицированный пользователь (user)** — может читать всё, как и Аноним, дополнительно может публиковать отзывы и ставить рейтинг произведениям (фильмам/книгам/песенкам), может комментировать чужие отзывы и ставить им оценки; может редактировать и удалять свои отзывы и комментарии.

**Модератор (moderator)** — те же права, что и у Аутентифицированного пользователя плюс право удалять и редактировать любые отзывы и комментарии.

**Администратор (admin)** — полные права на управление проектом и всем его содержимым. Может создавать и удалять произведения, категории и жанры. Может назначать роли пользователям.

# Деплой проекта

Для развертывания проекта у вас на машине должен быть установлен docker.
Клонируйте репозиторий с гитхаба в директорию на своей машине. Запустите терминал. С помощью терминала войдите в директорию с проектом и выполните команду 'docker-compose up'.

# Создание учетной записи администратора

В терминале из директории проекта выполните команду 'docker exec -i -t django_web python manage.py createsuperuser'.

Вы можете залогиниться под учетной запиьсю администратора по адресу '127.0.0.1/admin/' (http://localhost/admin/)

# Заполнение базы начальными данными

После развертывания проекта, когда в базе еще нет данных, в терминале из директории проекта выполните команду 'docker exec -i -t django_web python manage.py loaddata fixtures.json'

# Работа с проектом

Подробная документация по работе с проектом доступна после развертывания проекта по адресу '127.0.0.1/redoc/'
