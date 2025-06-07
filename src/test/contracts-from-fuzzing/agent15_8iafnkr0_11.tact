message(100) Msg{}

struct Wrapper {
  msg: Msg;
}

contract HasWrappedMsg {
  field: Wrapper;

  init() {
    self.field = Wrapper{ msg: Msg{} };
  }
}