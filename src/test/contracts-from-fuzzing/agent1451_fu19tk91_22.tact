struct Tail {
  extra: Slice as remaining;
}

contract RemainViaInit {
  t: Tail;

  init() {
    self.t = Tail{
      extra: emptyCell().asSlice(),
    };
  }

  receive() {
    self.t = self.t;
  }
}