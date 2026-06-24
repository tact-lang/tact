struct Base {
  x: Int;
}

struct Middle {
  base: Base;
  flag: Bool;
}

struct Outer {
  mid: Middle;
  y: Int?;
  text: String;
}

contract NestedOptionalsStruct {
  storage: Outer;

  init() {
    self.storage = Outer{
      mid: Middle{ base: Base{ x: 5 }, flag: false },
      y: null,
      text: "ok",
    };
  }
}