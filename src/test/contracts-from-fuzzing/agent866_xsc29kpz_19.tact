struct Chain1 {
  a: Int;
}

struct Chain2 {
  prev: Chain1;
}

struct Chain3 {
  prev: Chain2;
}

struct Chain4 {
  prev: Chain3;
}

struct Chain5 {
  prev: Chain4;
}

contract Flat {
  s: Chain5;
  init() {
    self.s = Chain5 { prev: Chain4 { prev: Chain3 { prev: Chain2 { prev: Chain1 { a: 1 } } } } };
  }
}