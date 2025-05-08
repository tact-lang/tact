struct OptWrap {
  inner: Inner?;
}

struct Inner {
  a: Int;
  b: Bool?;
}

contract Test {
  o: OptWrap;
  init() {
    self.o = OptWrap{ inner: null };
  }
}