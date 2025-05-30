struct NestedOpt {
  inner1: Bool?;
  inner2: Int?;
  inner3: String?;
  inner4: Address?;
  inner5: Cell?;
}

struct OuterOpt {
  nested: NestedOpt?;
  val: Int;
}

contract OptionalOfStructOptionalField {
  s: OuterOpt;
  init() {
    self.s = OuterOpt{
      nested: null,
      val: 42
    };
  }
}