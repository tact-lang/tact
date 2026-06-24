struct One { a: Int; }
struct Two { a: Int; b: Int; }
struct Three { a: Int; b: Int; c: Int; }

contract MultipleNestedDifferentStructs {
  s1: One;
  s2: Two;
  s3: Three;

  init() {
    self.s1 = One{a:1};
    self.s2 = Two{a:2,b:3};
    self.s3 = Three{a:4,b:5,c:6};
  }
}