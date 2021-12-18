// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

void main() {
  const maxRandom = 100;
  var random = Random();
  var answer = random.nextInt(maxRandom) + 1;
  var isCorrect = false;
  var guessCount = 0;

  print('╔════════════════════════════════════════');
  print('║            GUESS THE NUMBER            ');
  print('╟────────────────────────────────────────');

  do {
    stdout.write('║ Guess the number between 1 and $maxRandom: ');
    var input = stdin.readLineSync();
    var guess = int.tryParse(input!);
    if (guess == null) {
      continue;
    }

    guessCount++;

    if (guess > answer) {
      print('║ ➜ $guess is TOO HIGH! ▲');
      print('╟────────────────────────────────────────');
    } else if (guess < answer) {
      print('║ ➜ $guess is TOO LOW! ▼');
      print('╟────────────────────────────────────────');
    } else {
      print('║ ➜ $guess is CORRECT ❤, total guesses: $guessCount');
      print('╟────────────────────────────────────────');
      isCorrect = true;
    }
  } while (!isCorrect);

  print('║                 THE END                ');
  print('╚════════════════════════════════════════');
}
