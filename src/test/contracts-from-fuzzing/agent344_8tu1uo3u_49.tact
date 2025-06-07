struct Boo {
  b: Bool;
}

contract InitNested {
  val: Boo;

  init() {
    self.val = Boo{ b: true };
  }
}