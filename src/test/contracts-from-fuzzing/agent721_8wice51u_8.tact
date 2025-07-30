struct Child {
  val: Int;
  opt: Bool?;
}

struct Parent {
  id: Int;
  child1: Child;
  child2: Child;
  text: String?;
}

contract NestedFields {
  data: Parent = Parent{
    id: 1,
    child1: Child{val: 11, opt: null},
    child2: Child{val: 22, opt: true},
    text: null
  };
}