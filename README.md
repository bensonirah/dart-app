A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

## Functions

```dart
int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

var result = fibonacci(20);


flybyObjects.where((name) => name.contains('turn')).forEach(print);


bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}


isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}


bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;

```

**Named parameter**

```dart
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool? bold, bool? hidden}) {...}

enableFlags(bold: true, hidden: false);
// Default value
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool bold = false, bool hidden = false}) {...}

// bold will be true; hidden will be false.
enableFlags(bold: true);

// A mandatory parameter
const Scrollbar({super.key, required Widget child});
// Required but nullable
const Scrollbar({super.key, required Widget? child});
```

**Optional positional parameters**

```dart
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}
```

**The main() function**

```dart
// A top-level function every dart app must have
  void main() {
    print('Hello, World!');
  }

  // With a command line application
  void main(List<String> arguments) {
      print(arguments);
  }
```

**Functions as first-class objects**

Pass function a parametter of other function

```dart
void printElement(int element) {
  print(element);
}

var list = [1, 2, 3];

// Pass printElement as a parameter.
list.forEach(printElement);
```

Or assign a function to a variable

```dart
var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
asert(loudify('hello')=='!!! HELLO !!!');
```


