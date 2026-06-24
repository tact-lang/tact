struct Child {
  x: Int;
  y: Int?;
  flag: Bool;
}

struct Parent {
  id: Int;
  child1: Child;
  child2: Child?;
  text: String;
}

contract LargeNested {
  big: Parent;

  init() {
    self.big = Parent{
      id: 7,
      child1: Child{x:1, y: null, flag:true},
      child2: null,
      text: "ok"
    };
  }
}