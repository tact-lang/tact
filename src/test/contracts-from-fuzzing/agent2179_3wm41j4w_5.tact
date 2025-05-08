struct Complex {
  int1: Int;
  opt2: Bool?;
  addr3: Address;
  bool4: Bool;
  str5: String;
}

contract MixedStructFields {
  data: Complex;

  init() {
    self.data = Complex{
      int1: 1, opt2: null, addr3: myAddress(), bool4: true, str5: "hello"
    };
  }
}