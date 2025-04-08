struct DeeplyNested {
  x: Int;
  y: Bool;
}

struct Middle {
  inner: DeeplyNested;
  flag: Bool;
}

contract NestedStructs {
  mid: Middle;

  init() {
    self.mid = Middle{
      inner: DeeplyNested{x: 10, y: false},
      flag: true
    };
  }
}