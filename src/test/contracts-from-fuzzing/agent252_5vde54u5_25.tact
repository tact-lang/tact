struct Nest1 {
  a: Int;
}

struct Nest2 {
  b: Int;
  nest1: Nest1;
}

struct Nest3 {
  c: Int;
  nest2: Nest2;
}

struct Nest4 {
  d: Int;
  nest3: Nest3;
}

contract DeepChain {
  val: Nest4;

  init() {
    self.val = Nest4{
      d:1,
      nest3: Nest3{
        c:2,
        nest2: Nest2{
          b:3,
          nest1: Nest1{
            a:4
          }
        }
      }
    };
  }
}