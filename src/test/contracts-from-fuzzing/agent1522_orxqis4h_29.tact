struct NestOptSer {
  val: Int? as uint32;
}

contract OptionalWithSerialization {
  s: NestOptSer;

  init() {
    self.s = NestOptSer{
      val: null,
    };
  }

  receive() {
    let _ = self.s;
  }
}