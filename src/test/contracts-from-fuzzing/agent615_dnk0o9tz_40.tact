struct InnerAddr {
  a: Address;
}

struct InnerStr {
  s: String;
}

struct Both {
  x: InnerAddr;
  y: InnerStr;
}

contract TestContract {
  v: Both;
  init() {
    self.v = Both {
      x: InnerAddr { a: myAddress() },
      y: InnerStr { s: "hello" }
    };
  }
}