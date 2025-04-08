struct Array4 {
  a: Int;
  b: Int;
  c: Int;
  d: Int;
}

struct Array8 {
  s1: Array4;
  s2: Array4;
}

contract NestedArrayTest {
  arr: Array8;

  init() {
    self.arr = Array8{
      s1: Array4{ a:1,b:2,c:3,d:4 },
      s2: Array4{ a:5,b:6,c:7,d:8 }
    };
  }
}
