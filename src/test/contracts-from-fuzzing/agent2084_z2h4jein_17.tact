struct InnerSub {
  a: Int;
  b: Bool?;
}

struct MainNest {
  s: String;
  inner: InnerSub;
}

contract Test {
  storage: MainNest;

  init() {
    self.storage = MainNest{
      s: "X",
      inner: InnerSub{
        a: 77,
        b: null
      }
    };
  }
}