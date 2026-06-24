struct C {
  x: Int;
  y: Bool;
}

contract OptWithDefaultVal {
  val: C? = null;

  init() {
    self.val = null;
  }
}