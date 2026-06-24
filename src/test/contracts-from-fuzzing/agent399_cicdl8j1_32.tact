struct StructA {
  a:Int; b:Int
}

struct StructB {
  b:Int; a:Int
}

contract StructOrderTest {
  one:StructA;
  two:StructB;

  init() {
    self.one = StructA{ a:1,b:2 };
    self.two = StructB{ b:3,a:4 };
  }
}