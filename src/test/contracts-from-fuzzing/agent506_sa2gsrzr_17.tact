struct Container2 {
  num: Int;
  flag: Bool;
}

contract OptionalFieldWithDefault {
  state: Container2? = null;

  init() {
    self.state = Container2{
      num: 55,
      flag: true
    };
  }
}