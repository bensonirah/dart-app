void repeat({int times = 2, Function? callback}) {
  print("");
  for (int count = 0; count < times; count++) {
    callback!("times: $count");
  }
}

String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void main(List<String> arguments) {
  print(arguments);
}
