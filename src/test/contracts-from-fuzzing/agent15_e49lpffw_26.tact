// Struct with many optional fields as deep nesting
struct A {
  v: Int?;
}
struct B {
  a: A;
  w: Bool?;
}
struct C {
  b: B;
}
struct D {
  c: C;
}
contract DeepManyNulls {
  root: D;
  init() {
    self.root = D{
      c: C{
        b: B{
          a: A{ v:null },
          w:null
        }
      }
    };
  }
}