// Intentionally missing trailing comma in nested instantiation
struct Nested {
  x: Int;
  y: Int;
}

contract TrailingComma {
  s: Nested;
  init() {
    self.s = Nested{x:1,y:2};
  }
}