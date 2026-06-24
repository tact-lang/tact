struct T1 {
  a: Int;
  b: Bool?;
}

struct T2 {
  t1: T1;
  s: String?;
}

struct T3 {
  t2: T2;
  i: Int;
}

contract MixedOptional {
  data: T3;

  init() {
    self.data = T3{
      t2: T2{
        t1: T1{
          a: 100,
          b: null
        },
        s: "xyz"
      },
      i: -55
    };
  }
}