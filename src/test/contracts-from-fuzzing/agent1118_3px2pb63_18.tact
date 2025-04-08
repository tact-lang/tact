struct Complex {
  i: Int;
  s: String;
  nested: Nested?;
}

struct Nested {
  f: Bool;
  addr: Address?;
}

contract ComplexFields {
  data: Complex;

  init() {
    self.data = Complex{
      i: 1,
      s: "abc",
      nested: Nested{ f: false, addr: null }
    };
  }
}