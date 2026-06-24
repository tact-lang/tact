struct DeeplyNested {
  sub1: Nested1;
}

struct Nested1 {
  sub2: Nested2;
}

struct Nested2 {
  sub3: Nested3;
}

struct Nested3 {
  value: Int;
}

contract TestContract {
  nested: DeeplyNested;

  init() {
    self.nested = DeeplyNested{
      sub1: Nested1{
        sub2: Nested2{
          sub3: Nested3{
            value: 123
          }
        }
      }
    };
  }
}
