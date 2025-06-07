struct OptionalHolder {
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract OptionFields {
  data: OptionalHolder;

  init() {
    self.data = OptionalHolder{
      optInt: null,
      optBool: null,
      optStr: null
    };
  }
}
