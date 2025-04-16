struct Options {
  flag: Bool?;
  text: String?;
  val: Int?;
}

contract OptionFields {
  o1: Options;
  o2: Options;

  init() {
    self.o1 = Options{ flag: null, text: null, val: null };
    self.o2 = Options{ flag: true, text: "hi", val: 100 };
  }
}