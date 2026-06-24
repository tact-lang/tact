struct LargeNested {
  a: Int;
  nest1: Nest1;
}

struct Nest1 {
  b: Int;
  nest2: Nest2;
}

struct Nest2 {
  c: Int;
  nest3: Nest3;
}

struct Nest3 {
  d: Int;
  nest4: Nest4;
}

struct Nest4 {
  e: Int;
}

contract DeepChain {
  data: LargeNested;

  init() {
    self.data = LargeNested{
      a:1,
      nest1: Nest1{
        b:2,
        nest2: Nest2{
          c:3,
          nest3: Nest3{
            d:4,
            nest4: Nest4{ e:5 }
          }
        }
      }
    };
  }
}
