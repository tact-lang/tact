message(0x1111) InnerMsg {
  x: Int;
}

struct Inner {
  m: InnerMsg?;
}

struct Mid {
  nested: Inner;
}

contract TestContract {
  val: Mid;
  init() {
    self.val = Mid{
      nested: Inner{m: null}
    };
  }
}