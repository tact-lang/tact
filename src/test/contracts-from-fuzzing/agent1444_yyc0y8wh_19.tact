// optional of struct with optionals
struct Bar {
  x: Int?;
  y: String?;
}

contract OuterOpt {
  field: Bar?;

  init() {
    self.field = null;
  }
}
