struct Chain5 {
  a: Int;
}

struct Chain4 {
  next: Chain5;
}

struct Chain3 {
  next: Chain4;
}

struct Chain2 {
  next: Chain3;
}

struct Chain1 {
  next: Chain2;
}

contract ChainNested {
  val: Chain1;
  init() {
    self.val = Chain1{next:Chain2{next:Chain3{next:Chain4{next:Chain5{a:5}}}}};
  }
}