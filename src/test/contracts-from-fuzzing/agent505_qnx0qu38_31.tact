struct SerOpt {
  x: Int as uint8;
  y: Bool;
  s: String?;
}

contract SerOptContract {
  val: SerOpt = SerOpt{ x: 250, y: false, s: null };

  init() {
    self.val = self.val;
  }

  receive() {
    self.val = self.val;
  }
}