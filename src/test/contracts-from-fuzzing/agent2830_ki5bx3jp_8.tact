struct InnerMost {
  val: Int?;
}

struct Inner {
  a: InnerMost;
  b: String;
}

struct Outer {
  inner: Inner;
  flag: Bool;
}

contract ThreeLayer {
  storage: Outer;
  init() {
    self.storage = Outer{
      inner: Inner{
        a: InnerMost{val:null},
        b: "deep"
      },
      flag: true
    };
  }
}