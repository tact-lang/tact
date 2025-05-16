// Optionals combined with defaults in nested structs
struct Sub {
  a: Int = 15;
  b: Bool?;
}

struct Top {
  s: Sub?;
  name: String = "hi";
}

contract NestedOptDefault {
  top: Top?;

  init() {
    self.top = Top{
      s: null,
    };
  }
}