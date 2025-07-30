message Msg {
  id: Int;
}

struct Container {
  msg: Msg;
}

contract Test {
  receive(message: Msg) {
    let c = Container{msg: message};
  }
}