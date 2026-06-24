struct Compose {
  val: Int;
  flag: Bool;
}

contract NestedOptionals {
  comp: Compose?;

  init() {
    self.comp = Compose{ val: 5, flag: true };
  }
}
