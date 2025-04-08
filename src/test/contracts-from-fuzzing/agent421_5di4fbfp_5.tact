struct Complex {
  i: Int;
  flag: Bool;
  addr: Address;
  text: String;
}

contract MultiType {
  data: Complex;

  init() {
    self.data = Complex{
      i: 123,
      flag: true,
      addr: myAddress(),
      text: "hello"
    };
  }
}