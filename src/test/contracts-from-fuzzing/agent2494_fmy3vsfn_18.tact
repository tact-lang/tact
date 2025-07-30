struct Mix {
  n: Int;
  s: String;
  flag: Bool;
  addr: Address;
}

contract AllPrimitives {
  f: Mix;
  init() {
    self.f = Mix{
      n: 1,
      s: "hello",
      flag: true,
      addr: myAddress()
    };
  }
}