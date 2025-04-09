struct Complex {
  intF: Int;
  boolF: Bool;
  strF: String;
  optIntF: Int?;
  optStrF: String?;
}

contract ComplexFields {
  fld: Complex;
  init() {
    self.fld = Complex{
      intF: 1,
      boolF: true,
      strF: "s",
      optIntF: null,
      optStrF: null
    };
  }
}