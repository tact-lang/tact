struct Texty {
  s: String = "hello";
  comment: Slice?;
}

contract ContractStrings {
  data: Texty;

  init() {
    self.data = Texty{ comment: null };
  }
}
