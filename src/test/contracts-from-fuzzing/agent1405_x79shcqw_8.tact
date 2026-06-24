struct WithString {
  t: String;
  v: Int;
}

contract StringFieldContract {
  data: WithString;

  init() {
    self.data = WithString{ t: "hello", v: 123 };
  }

  receive() {
    let _ = self.data;
  }
}