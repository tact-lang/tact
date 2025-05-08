struct Inner {
  val: Int;
  flag: Bool;
}

struct Outer {
  nested: Inner;
  txt: String;
  opt: Int?;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{ val: 123, flag: false },
      txt: "hi",
      opt: null
    };
  }
}