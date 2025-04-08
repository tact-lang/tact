struct Leaf {
  val: Int;
}

contract NestedOptionals {
  opt1: Leaf?;
  opt2: Leaf?;

  init() {
    self.opt1 = null;
    self.opt2 = Leaf{ val: 123 };
  }
}