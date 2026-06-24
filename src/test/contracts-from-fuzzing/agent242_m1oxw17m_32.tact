struct MultiNestedOpt {
  a: Int?;
  b: Nested1?;
}

struct Nested1 {
  c: Nested2?;
  d: Bool;
}

struct Nested2 {
  e: String?;
  f: Address?;
}

contract DeepOptionalFields {
  f: MultiNestedOpt;

  init() {
    self.f = MultiNestedOpt{
      a: null,
      b: Nested1{
        c: Nested2{
          e: null,
          f: null,
        },
        d: true,
      },
    };
  }
}