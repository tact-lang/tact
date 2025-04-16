struct Base {
  a: Int;
  b: String;
}

struct Child {
  base: Base;
  c: Bool;
}

contract StructInStruct {
  s: Child;
  init() {
    self.s = Child{ base: Base{ a:1, b:"test" }, c:true };
  }
}