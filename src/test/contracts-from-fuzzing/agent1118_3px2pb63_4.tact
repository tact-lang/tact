struct MismatchOpt {
  a: Int?;
  b: Bool;
  c: String?;
}

contract OptionalMix {
  data: MismatchOpt;

  init() {
    self.data = MismatchOpt{
      a: null,
      b: true,
      c: null
    };
  }
}