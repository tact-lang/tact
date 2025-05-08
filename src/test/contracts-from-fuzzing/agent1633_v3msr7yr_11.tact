struct Chain1 {
    f: Int;
}

struct Chain2 {
    c: Chain1;
}

struct Chain3 {
    c: Chain2;
}

struct Chain4 {
    c: Chain3;
}

struct Chain5 {
    c: Chain4;
}

contract VeryDeepChain {
  storage: Chain5;

  init() {
    self.storage = Chain5{
      c: Chain4{
        c: Chain3{
          c: Chain2{
            c: Chain1{
              f: 123
            }
          }
        }
      }
    };
  }
}