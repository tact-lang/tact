struct SInner {
  a: Int;
  b: Bool;
  c: String;
}

struct SOuter {
  inner1: SInner;
  inner2: SInner;
  inner3: SInner;
}

contract LargeNested {
  val: SOuter;

  init() {
    self.val = SOuter{
      inner1: SInner{a: 1, b: true, c: "1"},
      inner2: SInner{a: 2, b: false, c: "2"},
      inner3: SInner{a: 3, b: true, c: "3"}
    };
  }
}