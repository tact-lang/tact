struct SN {
  foo: String? = "abc";
  bar: Int?;
}

contract TestContract {
  val: SN;

  init() {
    self.val = SN{ bar:5 };
  }
}