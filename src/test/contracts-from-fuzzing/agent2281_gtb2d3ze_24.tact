struct InnerA {
  x: Int;
}

struct InnerB {
  y: Bool;
}

struct Container {
  a: InnerA;
  b: InnerB;
}

contract NestedStructs {
  val: Container;

  init() {
    self.val = Container{
      a: InnerA{ x:1 },
      b: InnerB{ y:true }
    };
  }
}