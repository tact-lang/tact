// optional message nested inside struct field with default null
message(0x42) Innerm { a: Int }

struct Contain {
  m: Innerm? = null;
}

contract OptMsgInsideStruct {
  data: Contain;

  init() {
    self.data = Contain{};
  }
}