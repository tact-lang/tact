struct DeepAStruct {
  a: Int;
  b: B;
}

struct B {
  c: Int;
  d: C;
}

struct C {
  e: Int;
  f: D;
}

struct D {
  g: Int;
}

contract DeepA {
  root: DeepAStruct = DeepAStruct{
    a: 1,
    b: B{
      c: 2,
      d: C{
        e: 3,
        f: D{
          g: 4
        }
      }
    }
  };

  init() {}
}
