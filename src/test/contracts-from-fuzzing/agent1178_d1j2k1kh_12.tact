struct SOption {
  val: Int?;
}

contract Test {
  item: SOption;

  init() {
    self.item = SOption{val: null};
  }
}