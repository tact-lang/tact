struct Inner {
  innerVal: Int?;
}

struct Outer {
  flag: Bool;
  content: Inner;
}

contract OptionalEdgeCase {
  state: Outer;
  init() {
    self.state = Outer{
      flag: false,
      content: Inner{innerVal:null}
    };
  }
}