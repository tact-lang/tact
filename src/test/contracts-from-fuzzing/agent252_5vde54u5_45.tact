struct Regular {
  a: Int;
}

struct Wrap1 {
  w1: Regular;
}

struct Wrap2 {
  w2: Wrap1;
}

struct Wrap3 {
  w3: Wrap2;
}

contract WrapTest {
  val: Wrap3;

  init() {
    self.val = Wrap3{
      w3: Wrap2{
        w2: Wrap1{
          w1: Regular{a:999}
        }
      }
    };
  }
}