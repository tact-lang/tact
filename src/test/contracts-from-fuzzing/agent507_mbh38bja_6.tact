struct Inner {
  x: Int;
  y: String;
}

struct Outer {
  a: Inner;
  b: Inner?;
  c: Inner;
}

contract MixedNestedOptional {
  data: Outer;

  init() {
    self.data = Outer{
      a: Inner{x:1,y:"one"},
      b: null,
      c: Inner{x:3,y:"three"}
    };
  }
}
