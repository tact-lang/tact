struct Msg {
  f: Int;
}

contract MapToMsg {
  m: map<Int, Msg>;

  init() {
    self.m = emptyMap();
  }
}