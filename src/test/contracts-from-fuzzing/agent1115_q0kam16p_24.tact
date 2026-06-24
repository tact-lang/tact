// contract with mixture of fields and default values
contract Defaults {
  a: Int = 5;
  b: Bool = false;
  c: Int?;
  d: Bool?;
  e: String = "Hello";

  init() {
    self.c = 123;
    self.d = null;
  }
}