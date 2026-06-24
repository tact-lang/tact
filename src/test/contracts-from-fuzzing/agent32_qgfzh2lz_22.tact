struct Complex {
    i: Int;
    s: String;
    b: Bool;
    opti: Int?;
    addr: Address;
    optAddr: Address?;
    optS: String?;
}

contract ComplexPersists {
  field: Complex;

  init() {
      self.field = Complex {
          i: 42,
          s: "hello",
          b: true,
          opti: null,
          addr: myAddress(),
          optAddr: null,
          optS: null
      };
  }
}
