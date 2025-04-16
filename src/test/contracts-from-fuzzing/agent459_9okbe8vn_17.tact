struct A1 {
  f1: Int;
}

struct A2 {
  f2: Int;
}

struct A3 {
  f3: Int;
}

struct A4 {
  s1: A1;
  s2: A2;
  s3: A3;
}

contract InheritStructs {
  all: A4;

  init() {
    self.all = A4{
      s1: A1{f1:1},
      s2: A2{f2:2},
      s3: A3{f3:3}
    };
  }
}