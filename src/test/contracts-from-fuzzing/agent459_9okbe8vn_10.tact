struct Small1 { a: Int; }
struct Small2 { b: Int; }
struct Small3 { c: Int; }
struct Combined {
  s1: Small1;
  s2: Small2;
  s3: Small3;
}

contract NestedManyStructs {
  comb: Combined;

  init() {
    self.comb = Combined{
      s1: Small1{ a:1 },
      s2: Small2{ b:2 },
      s3: Small3{ c:3 }
    };
  }
}