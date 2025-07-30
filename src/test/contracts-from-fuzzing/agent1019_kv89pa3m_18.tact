struct DefaultVals {
  s: String = "abc";
  b: Bool = true;
  i: Int = 42;
  o: Int? = null;
}

contract DefValsContract {
  val: DefaultVals;

  init() {
    self.val = DefaultVals{ };
  }
}
