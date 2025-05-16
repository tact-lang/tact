// Large contract with large nested struct
struct Child {
  a: Int;
  b: Bool;
  c: String;
  d: Slice;
}

struct Parent {
  x: Child;
  y: Child;
  z: Child;
}

contract Test {
  p: Parent;

  init() {
    self.p = Parent{
      x: Child{a:1,b:true,c:"x",d: emptyCell().asSlice()},
      y: Child{a:2,b:false,c:"y",d: emptyCell().asSlice()},
      z: Child{a:3,b:true,c:"z",d: emptyCell().asSlice()},
    };
  }
}