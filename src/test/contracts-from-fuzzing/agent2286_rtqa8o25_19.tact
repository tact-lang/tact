struct S1 {
 a: Int;
}

struct S2 {
 b: Int;
 inner: S1;
}

contract NestedStructStorage {
 s2: S2 = S2{
  b: 5,
  inner: S1{ a: 10 }
 };

 init() {
  self.s2 = S2{
   b: 15,
   inner: S1{ a: 20 }
  };
 }
}