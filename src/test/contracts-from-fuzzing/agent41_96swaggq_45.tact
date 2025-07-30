struct BigConstants {
  c1: Int = 100;
  c2: Int = 200;
  c3: Int = 300;
}

contract ConstInit {
  val: BigConstants;

  init() {
    self.val = BigConstants{};
  }
}
