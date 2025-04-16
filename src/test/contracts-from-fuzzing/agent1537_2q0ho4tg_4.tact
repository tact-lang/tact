struct S {
  optionalInt: Int?;
  optionalBool: Bool?;
  optionalAddress: Address?;
  optionalCell: Cell?;
}

contract Test {
  s: S;

  init() {
    self.s = S{
      optionalInt: null,
      optionalBool: true,
      optionalAddress: null,
      optionalCell: emptyCell(),
    };
  }
}