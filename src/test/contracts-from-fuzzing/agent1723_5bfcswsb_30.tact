struct DefaultVals {
  a: Int = 5;
  b: String = "hello";
  c: Bool = true;
}

contract DefaultsTest {
  val: DefaultVals;

  init() {
    self.val = DefaultVals{ a:7, b:"x", c:false };
  }
}