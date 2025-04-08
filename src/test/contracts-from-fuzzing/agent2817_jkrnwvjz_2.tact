struct InnerOpt {
  str: String;
  val: Int?;
}

contract Optionals {
  val1: InnerOpt;

  init() {
    self.val1 = InnerOpt{ str: "hello", val: null };
  }
}
