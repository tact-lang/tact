message(42) Msg {foo:Int}

contract Test {
  m: Msg;

  init() {
    self.m = Msg{foo: 1};
  }

  receive() {}
}
