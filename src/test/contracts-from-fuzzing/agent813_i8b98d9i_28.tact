struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { s1: S1; s2: S2; }

contract MultiStructSameLevel {
  f: S3;
  
  init() {
    self.f = S3{ s1: S1{ a: 5 }, s2: S2{ b: true } };
  }
}