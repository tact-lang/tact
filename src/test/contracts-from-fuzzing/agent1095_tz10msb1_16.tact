struct DeepInner {
  a: Int;
  b: Bool?;
}

struct Middle {
  inner: DeepInner;
  opt: DeepInner?;
}

contract ManyNestedOpts {
  state: Middle?;

  init() {
    self.state = Middle{
      inner: DeepInner{ a:5, b:null },
      opt: DeepInner{ a:1, b:true }
    };
  }
}