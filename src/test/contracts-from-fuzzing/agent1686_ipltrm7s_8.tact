struct Defaults {
  num: Int = 10;
  flag: Bool = true;
  text: String = "ok";
  addr: Address;
}

contract StructWithDefaults {
  data: Defaults;

  init() {
    self.data = Defaults{
      addr: myAddress()
    };
  }
}