// optional message struct as contract persistent field
message(42) Msg {
  num: Int;
}

contract TestContract {
  m: Msg?;

  init() {
    self.m = null;
  }
}