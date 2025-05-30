// Testing contract with default values and override in init
contract DefaultsOverride {
  a: Int = 5;
  b: Bool = true;
  s: String = "hey";

  init() {
    self.a = 100;
    self.b = false;
    self.s = "changed";
  }
}