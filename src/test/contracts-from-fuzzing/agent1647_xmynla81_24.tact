message(17) DeepMsg {
  code: Int;
  note: String?;
}

struct Inner {
  val: Int;
  msg: DeepMsg?;
}

struct Outer {
  i: Int;
  inner: Inner;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      i: 5,
      inner: Inner{
        val: 42,
        msg: DeepMsg{code: 999, note: "hi"}
      }
    };
  }
}
