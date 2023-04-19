A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Dart API template

```code
  Future<List<#Todo>> get#Todos() async {
    final response = await http.get(Uri.parse('$baseUrl/#todos'));
    final body = jsonDecode(response.body) as List<dynamic>;
    final #todos = body
        .map((item) => #Todo.fromJson(item as Map<String, dynamic>))
        .toList();
    return #todos;
  }
```
