struct Inner {
 a: Int;
}

struct Outer {
 arr: Inner;
 b: Bool;
}

contract Ordering {
  field: Outer;

  init() {
    self.field = Outer{
      arr: Inner{a: 123},
      b: false
    };
  }
}