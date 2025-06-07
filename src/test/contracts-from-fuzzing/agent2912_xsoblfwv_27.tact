struct Sub {
  a: Int;
}

struct Container {
  s1: Sub;
  s2: Sub;
  s3: Sub;
}

contract MultiSub {
  c: Container;
  init() {
    self.c = Container{
      s1: Sub{ a:1 },
      s2: Sub{ a:2 },
      s3: Sub{ a:3 },
    };
  }
}