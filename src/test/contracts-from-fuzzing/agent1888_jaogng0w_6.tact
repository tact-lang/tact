struct Child {
  flag: Bool;
  count: Int;
}

struct Parent {
  one: Child;
  two: Child;
  three: Child;
  four: Child;
}

contract ManyNested {
  state: Parent;

  init() {
    self.state = Parent{
      one: Child{flag:true, count:1},
      two: Child{flag:false, count:2},
      three: Child{flag:true, count:3},
      four: Child{flag:false, count:4},
    };
  }
}
