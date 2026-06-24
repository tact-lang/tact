message(2) InnerMsg { foo: Int }

struct S {
  m: InnerMsg?;
}

contract OptMsgNested {
  data: S?;

  init() {
    self.data = null;
  }
}