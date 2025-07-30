struct InnerMost {
  flag: Bool;
}
struct Inner {
  a: Int;
  innerMost: InnerMost;
}
struct Outer {
  inner: Inner;
  msg: String;
}

contract MixDeep {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{ a:7, innerMost:InnerMost{flag:true} },
      msg:"test"
    };
  }
}
