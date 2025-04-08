struct Nested1 {
 x: Int;
}

struct Nested2 {
 y: String;
}

struct Nested3 {
 z: Bool;
}

contract MultiStructLayer(
  n1: Nested1,
  n2: Nested2?,
  n3: Nested3,
  text: String,
  flag: Bool,
  optInt: Int?,
  optStr: String?,
) {
}