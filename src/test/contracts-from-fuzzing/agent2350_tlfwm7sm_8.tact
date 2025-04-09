struct OptionalNested {
  opt1: Int?;
  opt2: Bool?;
  opt3: Address?;
  opt4: Cell?;
  opt5: String?;
}

struct DoubleNest {
  inner: OptionalNested;
  anotherInt: Int;
  anotherStr: String;
}

contract DeepOptionals {
  d: DoubleNest;

  init() {
    self.d = DoubleNest{
      inner: OptionalNested{
        opt1: null,
        opt2: null,
        opt3: null,
        opt4: null,
        opt5: null
      },
      anotherInt: 42,
      anotherStr: "test"
    };
  }
}