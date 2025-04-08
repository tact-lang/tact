struct S1 {
 x: Int;
 y: Int;
}

struct S2 {
 nested1: S1;
 nested2: S1;
}

contract TwoNestedStructs {
 s: S2;

 init() {
  self.s = S2{
    nested1: S1{ x:1, y:2 },
    nested2: S1{ x:3, y:4 }
  };
 }
}