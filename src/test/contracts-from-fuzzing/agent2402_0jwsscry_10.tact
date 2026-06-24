struct BoolNest {
  first: Bool;
  second: Bool?;
}

struct Outer {
  nested1: BoolNest;
  nested2: BoolNest?;
}

contract BoolNestContract {
  state: Outer;

  init() {
    self.state = Outer{
      nested1: BoolNest{ first: true, second: null },
      nested2: null
    };
  }
}