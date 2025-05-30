struct RemainS1 {
  val: String;
  rem: Slice as remaining;
}

struct Wrap {
  nested: RemainS1;
}

contract RemainingNested {
  s: Wrap;

  init() {
    self.s = Wrap{
      nested: RemainS1{
        val: "zzz",
        rem: emptyCell().asSlice(),
      }
    };
  }
}
