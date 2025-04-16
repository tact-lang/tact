struct ManyDefaults {
 a: Int = 1;
 b: Bool = true;
 c: String = "abc";
 d: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
 e: Int? = null;
 f: Bool? = null;
 g: String? = null;
 h: Address? = null;
}

contract Defaults {
  def: ManyDefaults;

  init() {
    self.def = ManyDefaults{};
  }
}