
# Vigenère cipher

### Короткі теоретичні відомості

Найбільш простими є шифри заміни або підстановки,  
особливістю яких є заміна символів (слів) відкритого тексту відповідними символами, які належать алфавітом шифротекста.

Розрізняють: одноалфавітну, багатоалфавітну заміну.Прикладом багатоалфавітного шифру заміни є система  
Віженера. Шифрування здійснюється за таблицею, що  
представляє собою квадратну матрицю розмірності n × n, де n -  
число символів алфавіту (для російського алфавіту - 32, для українського - 33). Перший рядок містить всі символи алфавіту.  Кожний наступний рядок виходить з попередньої шляхом  циклічного зсуву вправо на один символ (або вліво).  Вибирається ключ або ключова фраза.

**Після чого процес  зашифровування здійснюється наступним чином:**

- Під кожною буквою вихідного повідомленняпослідовно записуються літери ключа (якщо ключ коротше - його використовують кілька разів).

-  Кожна буква шифротекста знаходиться на перетиністовпця таблиці, визначається буквою відкритого  тексту, і рядки, яка визначається буквою ключа.

**Приклад.**  Повідомлення PURPLE, зашифроване ключемSMART за допомогою таблиці Віженера, перетвориться у шифротекст HGRGEW.

![]( https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Vigen%C3%A8re_square_shading.svg/1024px-Vigen%C3%A8re_square_shading.svg.png)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the  
[online documentation](https://docs.flutter.dev/), which offers tutorials,  
samples, guidance on mobile development, and a full API reference.

