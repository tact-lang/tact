struct BoolAndString {
  a: Bool;
  b: String;
  c: Bool?;
  d: String?;
}

contract TestStorage {
  bas: BoolAndString;

  init() {
    self.bas = BoolAndString{
      a: true,
      b: "hey",
      c: false,
      d: null
    };
  }
}