struct InnerA { a: Int }
struct InnerB { b: Bool }
struct BigS {
  one: InnerA;
  two: InnerB;
  optInt: Int?;
  optBool: Bool?;
}

contract ComboNestedPersistent {
  data: BigS;

  init() {
    self.data = BigS{
      one: InnerA{ a: 10 },
      two: InnerB{ b: true },
      optInt: null,
      optBool: false,
    };
  }
}