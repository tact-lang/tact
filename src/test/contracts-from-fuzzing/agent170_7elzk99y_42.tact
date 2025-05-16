// optional of primitive with default null in contract storage
contract OptPrimNull {
  x: Int? = null;
  y: Bool? = null;

  init() {
    self.x = null;
    self.y = null;
  }
}