struct D {
  x:Int;
}

contract C {
  foo: D;
  opt: D?;
  st: String;
  bt: Bool;

  init() {
    self.foo = D{ x: 7 };
    self.opt = null;
    self.st = "done";
    self.bt = true;
  }
}