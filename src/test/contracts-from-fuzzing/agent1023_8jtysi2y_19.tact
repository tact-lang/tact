// nested struct with primitive serialized fields, optional string, optional int
struct Mini {
  u: Int as uint16;
  v: Int as int8;
  s: String?;
}

contract DeepMini {
  data: Mini;

  init() {
    self.data = Mini {
      u: 512,
      v: -5,
      s: null
    };
  }
}
