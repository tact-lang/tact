struct Nested2 {
  n: Int;
}

struct Nested1 {
  foo: Nested2;
}

struct Outer {
  bar: Nested1;
}

contract DoubleNested {
  data: Outer;

  init() {
    self.data = Outer{
      bar: Nested1{
        foo: Nested2{
          n: 99
        }
      }
    };
  }
}