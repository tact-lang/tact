struct Deep {
  val: Int as uint16;
  flag: Bool?;
}

struct Middle {
  inner: Deep?;
  text: String?;
}

contract ComplexCombo {
  state: Middle?;

  init() {
    self.state = null;
  }
}