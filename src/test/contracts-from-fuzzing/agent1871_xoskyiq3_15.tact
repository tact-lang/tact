struct SubStruct {
  a: Int;
  b: Bool;
}

struct ParentStruct {
  x: Int;
  sub: SubStruct;
}

contract SubInParent {
  val: ParentStruct;

  init() {
    self.val = ParentStruct{ x: 9, sub: SubStruct{ a: 8, b: false } };
  }
}