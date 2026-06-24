struct Inner {
  count: Int;
}

struct Outer {
  nested: Inner?;
}

contract NestedOptional {
  data: Outer;

  init() {
    self.data = Outer{
      nested: Inner{
        count: 5
      }
    };
  }
}