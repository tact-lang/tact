struct ComposeTest {
  i: Int; b: Bool; s: String; c: Cell; sl: Slice; a: Address;
}

contract PersistentCompose {
  field: ComposeTest;
  
  init() {
    self.field = ComposeTest{
      i:1, b:true, s:"s", c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress()
    };
  }
}
