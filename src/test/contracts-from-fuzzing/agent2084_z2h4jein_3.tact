struct Complex {
  foo: Int;
  bar: Bool;
  optA: Int?;
  optB: String?;
  optC: Bool?;
  text: String;
}

contract Test {
  comp: Complex;

  init() {
    self.comp = Complex{
      foo: 1,
      bar: true,
      optA: null,
      optB: null,
      optC: false,
      text: "fuzz"
    };
  }
}
