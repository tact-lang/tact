struct MultiNest {
  a: Int;
  b: Nested;
}

struct Nested {
  c: Int;
  d: Inner;
}

struct Inner {
  e: Int;
  f: String?;
}

contract ComplexNested {
  val: MultiNest;

  init() {
    self.val = MultiNest{
      a: 1,
      b: Nested{
        c: 2,
        d: Inner{
          e: 3,
          f: null
        }
      }
    };
  }
}