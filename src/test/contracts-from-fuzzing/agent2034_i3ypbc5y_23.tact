struct WithString {
  s: String;
}

contract StringHolder {
  sv: WithString;

  init() {
    self.sv = WithString{ s: "hello" };
  }
}