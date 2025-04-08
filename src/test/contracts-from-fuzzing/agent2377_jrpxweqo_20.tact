struct OptionalInner {
  field: Int?;
}

struct ContainsOptionalInner {
  a: Int;
  b: OptionalInner?;
}

contract OptionalStructField {
  rec: ContainsOptionalInner;

  init() {
    self.rec = ContainsOptionalInner{
      a: 10,
      b: null,
    };
  }
}