struct S {
  s1: Int;
}

struct M1 {
  x: S;
}

struct M2 {
  y: M1;
}

struct M3 {
  z: M2;
}

contract DeepDeep {
  dd: M3 = M3{
    z: M2{
      y: M1{
        x: S{ s1: 555 }
      }
    }
  };
}
