struct S1 {
 x: Int;
}

struct S2 {
 y: S1;
}

struct S3 {
 z: S2;
}

struct S4 {
 t: S3;
}

struct S5 {
 u: S4;
}

contract FiveLevelNest {
 inner: S5;
 init() {
  self.inner = S5{ u: S4{ t: S3{ z: S2{ y: S1{ x:7 } } } } };
 }
}