struct MultiNested {
  s1: Int;
  s2: Bool;
  s3: String;
  s4: Address;
  s5: Cell;
  s6: Slice;
}

contract LargeMultiNested {
  val: MultiNested;

  init() {
    self.val = MultiNested{
      s1:1,
      s2:true,
      s3:"hey",
      s4:myAddress(),
      s5:emptyCell(),
      s6:emptyCell().asSlice(),
    };
  }
}