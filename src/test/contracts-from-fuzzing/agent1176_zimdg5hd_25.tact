struct StrNest {
  val: String = "";
  note: String = "";
}

contract EmptyStrings {
  storage: StrNest;

  init() {
    self.storage = StrNest{};
  }
}