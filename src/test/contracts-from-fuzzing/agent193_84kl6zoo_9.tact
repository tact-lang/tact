struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { c: Int; }

contract ManyStructs {
  one: S1;
  two: S2;
  three: S3;

  init() {
    self.one = S1{ a:1 };
    self.two = S2{ b:2 };
    self.three = S3{ c:3 };
  }
}