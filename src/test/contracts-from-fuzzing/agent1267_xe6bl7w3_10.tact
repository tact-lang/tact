struct Child1 {x: Int;}
struct Child2 {y: Int;}
struct Parent {
  child1: Child1?;
  child2: Child2?;
  info: String?;
}

contract NullableNested {
  val: Parent;

  init() {
    self.val = Parent{
      child1: null,
      child2: Child2{ y: 9 },
      info: null
    };
  }
}
