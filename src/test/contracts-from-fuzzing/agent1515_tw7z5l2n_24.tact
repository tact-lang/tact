struct Sub {
  val: Int? = null;
}

struct NestWrap {
  sub: Sub? = null;
}

contract NullNesting {
  data: NestWrap;

  init() {
    self.data = NestWrap{ sub: null };
  }

  receive() { dump(0); }
}