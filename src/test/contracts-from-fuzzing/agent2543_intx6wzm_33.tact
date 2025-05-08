struct SInner {
  v: Int;
}

struct LVL2 {
  s: SInner?;
  b: Bool;
}

struct LVL1 {
  next: LVL2;
  t: String;
}

contract NestedNullable {
  f: LVL1;
  init() {
    self.f = LVL1{
      next: LVL2{
        s: null,
        b: false
      },
      t: "x"
    };
  }
}