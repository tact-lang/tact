struct OptionalBoolInt {
  val: Int?;
  flag: Bool?;
}

contract OptionBoolIntStorage {
  data: OptionalBoolInt;

  init() {
    self.data = OptionalBoolInt{val:null, flag:null};
  }
}