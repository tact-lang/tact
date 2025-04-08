struct NestedStruct {
  a: Int;
  b: Bool;
  s: SubStruct;
}

struct SubStruct {
  x: Int;
  y: Bool;
  next: SubSubStruct;
}

struct SubSubStruct {
  q: Int;
  r: Bool;
}

contract DeepNested {
  val: NestedStruct;

  init() {
    self.val = NestedStruct{
      a: 1,
      b: false,
      s: SubStruct{
        x: 2,
        y: true,
        next: SubSubStruct{q: 3, r: false}
      }
    };
  }
}
