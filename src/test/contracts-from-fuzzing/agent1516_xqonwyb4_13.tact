struct X {
  k: Int;
  label: String;
}

struct Y {
  x1: X;
  flag: Bool;
  x2: X;
}

contract StructReuse {
  test: Y;

  init() {
    self.test = Y{
      x1: X{ k: 5, label: "first" },
      flag: true,
      x2: X{ k: 10, label: "second" }
    };
  }
}