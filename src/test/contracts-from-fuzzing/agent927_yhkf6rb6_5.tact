struct Inner {
  flag: Bool;
}

struct Outer {
  value: Int;
  nested: Inner;
}

contract NestedAssignmentTest {
  state: Outer;

  init() {
    self.state = Outer{
      value: 10,
      nested: Inner{ flag: true }
    };
  }
}