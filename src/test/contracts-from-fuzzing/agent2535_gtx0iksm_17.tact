struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: String;
}

struct Outer {
  first: Inner1;
  second: Inner2;
}

contract NestedMultipleStructs {
  storage: Outer;

  init() {
    self.storage = Outer {
      first: Inner1 { a: 123 },
      second: Inner2 { b: "x" }
    };
  }
}