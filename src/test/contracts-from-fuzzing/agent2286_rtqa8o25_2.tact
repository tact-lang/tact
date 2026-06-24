struct Deep {
  x: Int;
  y: Bool;
}

struct Mid {
  inner: Deep;
  flag: Bool;
}

struct Outer {
  m: Mid;
  s: String;
}

contract NestedFields {
  complex: Outer = Outer{
    m: Mid{ inner: Deep{ x: 0, y: false }, flag: true },
    s: "hi",
  };

  init() {
    self.complex = Outer{
      m: Mid{ inner: Deep{ x: 1, y: true }, flag: false },
      s: "bye",
    };
  }
}