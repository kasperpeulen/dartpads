void main() {
  Map map = {
    0: "not null",
    1: null
  };
  bool test(key) => map[key] == null;
  //test
  // This will remove all key/value pairs where the value is null.
  map.keys.where(test).toList().forEach(map.remove);

  // So the map should be of length 1 now.
  assert(map.length == 1);

  // prints {0: not null}
  print(map);
}