struct Weird {
  intf: Int;
  boolf: Bool;
  addr: Address;
  strf: String;
  optint: Int?;
  optbool: Bool?;
  optaddr: Address?;
  optstr: String?;
}

contract ComplexTypes {
  s: Weird;

  init() {
    self.s = Weird{
      intf: 1,
      boolf: false,
      addr: myAddress(),
      strf: "hello",
      optint: null,
      optbool: null,
      optaddr: null,
      optstr: null
    };
  }
}
