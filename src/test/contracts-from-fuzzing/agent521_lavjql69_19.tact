// contract with fields having default values and some overridden in init
contract DefaultsFields {
  a: Int = 5;
  b: Bool = false;
  c: String = "hello";

  init() {
    self.a = 42;
    self.b = true;
    self.c = "world";
  }
}