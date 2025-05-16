struct Pack {
  s: String;
  sopt: String?;
  b: Bool;
  bopt: Bool?;
}

contract PackedStructTest {
  pack: Pack;
  init() {
    self.pack = Pack{
      s: "foo",
      sopt: null,
      b: true,
      bopt: null,
    };
  }
}