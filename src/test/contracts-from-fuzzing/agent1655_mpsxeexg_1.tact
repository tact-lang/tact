struct Inner {
  x: Int;
  y: Bool;
}

contract TestC {
  val: Inner;

  init() {
    self.val = Inner{ x:3, y:true };
  }
}