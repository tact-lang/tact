struct NestedMany {
  a: Sub1;
  b: Sub2;
}

struct Sub1 {
  x: Int;
  y: String;
}

struct Sub2 {
  flag: Bool;
  label: String;
}

contract DeepCombo {
  data: NestedMany;

  init() {
    self.data = NestedMany{
      a: Sub1{ x: 2, y: "abc" },
      b: Sub2{ flag: true, label: "xyz" }
    };
  }
}