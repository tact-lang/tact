struct StructA {
  i: Int;
  b: Bool;
}

struct StructB {
  j: Int;
  c: Bool;
}

contract MultiStructFields {
  s1: StructA;
  s2: StructB;
  init() {
    self.s1 = StructA{i:1, b:true};
    self.s2 = StructB{j:2, c:false};
  }
}
