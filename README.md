## [REST API](http://localhost:8080/doc)

## Концепция:

- Spring Modulith
    - [Spring Modulith: достигли ли мы зрелости модульности](https://habr.com/ru/post/701984/)
    - [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
    - [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

```
  url: jdbc:postgresql://localhost:5432/jira
  username: jira
  password: JiraRush
```

- Есть 2 общие таблицы, на которых не fk
    - _Reference_ - справочник. Связь делаем по _code_ (по id нельзя, тк id привязано к окружению-конкретной базе)
    - _UserBelong_ - привязка юзеров с типом (owner, lead, ...) к объекту (таска, проект, спринт, ...). FK вручную будем
      проверять

## Аналоги

- https://java-source.net/open-source/issue-trackers

## Тестирование

- https://habr.com/ru/articles/259055/

---
### Запуск приложения 🚀
#### 1. Через Docker 🐳
- В Maven выбрать профиль **prod** 
- Сбилдить приложение:  
```bash
  mvn clean install
```
- Запустить через консоль:
```
docker compose up
```
- Перейти по ссылке: [http://localhost:80](http://localhost:80)
- Пример пользователя:
	- login: admin@gmail.com
	- password: admin
---
#### 2. Через IDEA 🎯
- Запустить локально сервер БД (PostgreSQL):
```
docker run -p 5432:5432 --name postgres-db -e POSTGRES_USER=jira -e POSTGRES_PASSWORD=JiraRush -e POSTGRES_DB=jira -e PGDATA=/var/lib/postgresql/data/pgdata -v ./pgdata:/var/lib/postgresql/data -d postgres
```
- В файле `.env` изменить значение:
```
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/jira
```
- Сбилдить приложение:  
```bash
  mvn clean install
```

- В IDEA открыть **Run | Edit Configurations**
    
- Выбрать конфигурацию запуска: **Spring Boot | JiraRushApplication**
    
- Включить **Enable EnvFile**
    
- Добавить файл `.env`, находящийся в корне проекта
    
- Нажать **Apply**, затем **Run**
![изображение](https://github.com/user-attachments/assets/870565a5-0930-4616-b46a-e8d364130480)

- Перейти по ссылке: [http://localhost:8080](http://localhost:8080)

---
# Список выполненных задач

1. Изучена и разобрана структура проекта (onboarding).

2. Удалены интеграции с социальными сетями: VK, Yandex.

3. Вынесена чувствительная информация в отдельный .env файл:
   - логин
   - пароль базы данных
   - идентификаторы для OAuth регистрации/авторизации
   - настройки почты

   Значения пропертей теперь считываются при старте сервера из переменных окружения.

4. Переделаны тесты: во время тестирования используется in-memory база данных H2 вместо PostgreSQL.

5. 

6. Проведен рефакторинг метода `com.javarush.jira.bugtracking.attachment.FileUtil#upload`:  
   теперь используется современный подход работы с файловой системой.

7.

8. 

9. Создан Dockerfile для основного сервера.

10. 

11. Написан `docker-compose` файл для запуска сервера вместе с базой данных и Nginx.  
    Для Nginx используется конфигурационный файл `config/nginx.conf`.

12. 
