message(100) Ping {
  x: Int;
}

contract HasMsg {
  p: Ping;
  init() {
    self.p = Ping{ x: 42 };
  }
}