struct MixedNest {
  a: Int;
  b: NestedB; 
}

struct NestedB {
  c: String;
  d: NestedC?;
}

struct NestedC {
  e: Bool;
  f: String?;
}

contract MixedStructTest {
  field: MixedNest;

  init() {
    self.field = MixedNest{
      a: 10,
      b: NestedB{
        c: "abc",
        d: NestedC{
          e: true,
          f: null,
        },
      },
    };
  }
}