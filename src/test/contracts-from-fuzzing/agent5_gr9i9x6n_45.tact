struct SubRem1 {
  y: Int;
  rem: Slice as remaining;
}

struct DeepRemWrap {
  sub: SubRem1;
  z: Int;
}

contract IllegalRemainingPosition {
  val: DeepRemWrap;

  init() {
    self.val = DeepRemWrap{
      sub: SubRem1{
        y: 10,
        rem: emptyCell().asSlice()
      },
      z: 20
    };
  }

  receive() {
    let _ = self.val.sub.y;
  }
}
