struct SerialOpts {
  val1: Int as uint4;
  val2: Int as int8;
  optVal: Int?;
  flag: Bool;
}

contract SerialOptNesting {
  nested: SerialOpts;

  init() {
    self.nested = SerialOpts{
      val1: 9,
      val2: -3,
      optVal: null,
      flag: true
    };
  }
}