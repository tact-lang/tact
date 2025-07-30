trait TraitA {
  val: Int;
}

contract TraitInherit with TraitA {
  val: Int;
  init() {
    self.val = 123;
  }
}