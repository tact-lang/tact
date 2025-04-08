struct InnerNested {
  valA: Int;
  valB: Bool?;
}

struct OuterNested {
  inner: InnerNested?;
  valC: String;
}

contract DeepPersistentNested {
  val1: OuterNested;
  
  init() {
    self.val1 = OuterNested{
      valC: "test",
      inner: null
    };
  }
}