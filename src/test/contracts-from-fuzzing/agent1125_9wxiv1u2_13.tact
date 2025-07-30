struct Inner1 { a: Int }
struct Inner2 { b: Bool }
struct Outer {
  inner1: Inner1?;
  inner2: Inner2?;
}

contract OptNested {
  field: Outer;
  init() {
    self.field = Outer{ inner1: null, inner2: null };
  }
}