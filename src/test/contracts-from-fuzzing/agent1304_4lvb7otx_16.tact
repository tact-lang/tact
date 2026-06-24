message(1) Msg { foo: Int }

struct Container {
  msg: Msg
}

contract StructMsgField {
  data: Container;

  init() {
    self.data = Container{ msg: Msg{ foo:42 } };
  }
}