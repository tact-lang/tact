contract MixedOpts {
  i: Int = 1;
  j: Int? = null;
  b: Bool = false;
  c: Bool? = null;
  s: String = "abc";
  t: String? = null;
  a: Address;
  z: Address? = null;

  init() {
    self.a = myAddress();
  }
}