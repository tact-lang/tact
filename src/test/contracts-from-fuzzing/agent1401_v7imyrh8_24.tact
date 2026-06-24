struct Levels3 {
  l0: Int;
  l1: Int;
  l2: Int;
}

contract ManyLevels {
  val: Levels3;

  init() {
    self.val = Levels3{l0:0,l1:1,l2:2};
  }
}