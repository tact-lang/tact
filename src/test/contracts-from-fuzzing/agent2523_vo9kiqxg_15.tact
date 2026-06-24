// primitive persistent fields defaults
contract ManyPrimitives {
  x: Int = 0;
  y: Int = 42;
  flag: Bool = false;
  message: String = "hello";
  opt: Int?; // null default

  init() {
    self.opt = null;
  }
}