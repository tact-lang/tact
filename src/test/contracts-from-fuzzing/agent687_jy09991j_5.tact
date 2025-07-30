struct Compose {
  s1: Int;
  s2: Bool;
  s3: String;
  s4: Cell;
  s5: Address;
  s6: Slice;
}

contract ComposeTest {
  storage: Compose;

  init() {
    self.storage = Compose{
      s1: 1,
      s2: false,
      s3: "abc",
      s4: emptyCell(),
      s5: myAddress(),
      s6: emptyCell().asSlice()
    };
  }
}