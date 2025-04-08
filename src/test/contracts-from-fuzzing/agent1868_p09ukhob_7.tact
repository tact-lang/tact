struct S1 {
  a: Int;
}

struct S2 {
  s: S1;
}

struct S3 {
  s: S2;
}

contract MultiNested {
  all: S3 = S3{ s: S2{ s: S1{ a: 7 } } };

  init() {}
}