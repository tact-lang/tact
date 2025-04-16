struct LargeCompose {
  s1: Int as int64;
  s2: String;
  s3: Bool;
  s4: String?;
  s5: Bool?;
  s6: Int?;
  s7: Slice;
  s8: Cell;
  s9: Address;
}

struct Wrapper {
  w1: Int;
  w2: LargeCompose;
}

contract DeepWrap {
  val: Wrapper;
  init() {
    self.val = Wrapper{
      w1: 7,
      w2: LargeCompose{
        s1: 42,
        s2: "str",
        s3: true,
        s4: null,
        s5: false,
        s6: null,
        s7: emptyCell().asSlice(),
        s8: emptyCell(),
        s9: myAddress(),
      }
    };
  }
}