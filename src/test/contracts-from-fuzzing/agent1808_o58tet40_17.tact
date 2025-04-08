struct S1 {
  a: Int;
}

struct S2 {
  b: Int;
}

struct S3 {
  c: Int;
}

struct Container {
  s1: S1;
  s2: S2;
  s3: S3;
}

contract ContainerTest {
  c: Container;

  init() {
    self.c = Container{
      s1: S1{ a: 10 },
      s2: S2{ b: 11 },
      s3: S3{ c: 12 }
    };
  }
}