struct Inner {
  flag: Bool = true;
  count: Int?;
}

struct Combo {
  x: Int;
  y: Int?;
  s: String = "hello";
  nested: Inner;
}

contract ComboStruct {
  data: Combo;

  init() {
    self.data = Combo{
      x: 7,
      y: null,
      nested: Inner{ count: 42 }
    };
  }
}
