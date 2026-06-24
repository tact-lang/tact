struct Inner1 { val1: Int; }
struct Inner2 { val2: Int; }
struct Inner3 { val3: Int; }

struct MultiNested {
  a: Inner1;
  b: Inner2;
  c: Inner3;
}

contract ManyNestedStructs {
  storage: MultiNested;

  init() {
    self.storage = MultiNested{
      a: Inner1{ val1: 1 },
      b: Inner2{ val2: 2 },
      c: Inner3{ val3: 3 },
    };
  }
}