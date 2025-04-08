struct Nested {
  x: Int;
  y: Int?;
}

contract TestContract {
  field: Nested;

  init() {
    self.field = Nested{
      x: 1,
      y: null,
    };
  }
}