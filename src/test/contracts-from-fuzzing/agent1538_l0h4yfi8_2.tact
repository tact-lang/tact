struct DeepNested {
  inner: Inner;
}

struct Inner {
  val: Int;
  txt: String;
  opt: Bool?;
}

contract Test {
  d: DeepNested;
  flag: Bool;

  init() {
    self.d = DeepNested{
      inner: Inner{ val: 10, txt: "abc", opt: true }
    };
    self.flag = false;
  }
}