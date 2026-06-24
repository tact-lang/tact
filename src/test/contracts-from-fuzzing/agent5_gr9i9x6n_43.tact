struct SubRem1 {
  y: Int;
  rem: Slice as remaining;
}

struct SubWrap {
  first: Int;
  sub: SubRem1;
}

contract NestedRemainingStruct {
  field: SubWrap;

  init() {
    self.field = SubWrap{
      first: 1,
      sub: SubRem1{
        y: 2,
        rem: emptyCell().asSlice()
      }
    };
  }

  receive() {
    let _ = self.field.sub.rem;
  }
}
