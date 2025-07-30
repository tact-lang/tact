struct Complex {
  flag: Bool;
  optInt: Int?;
  str: String;
  inner: InnerC;
}

struct InnerC {
  nestedBool: Bool;
  optStr: String?;
}

contract BigOptional {
  data: Complex?;

  init() {
    self.data = Complex{
      flag: true,
      optInt: null,
      str: "data",
      inner: InnerC{
        nestedBool: false,
        optStr: null,
      },
    };
  }
}