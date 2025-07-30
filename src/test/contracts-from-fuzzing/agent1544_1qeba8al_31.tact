struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }

contract NestedDifferent {
  one: S1;
  two: S2;
  three: S3;

  init() {
    self.one = S1{ a: 1 };
    self.two = S2{ s: S1{ a: 2 } };
    self.three = S3{ s: S2{ s: S1{ a: 3 } } };
  }
}
