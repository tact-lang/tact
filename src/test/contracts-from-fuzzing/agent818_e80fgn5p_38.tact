struct EmbeddedStruct {
  val1: Int;
  val2: NestedEmbedded;
}

struct NestedEmbedded {
  innerVal: Int?;
}

contract EmbedTest {
  e: EmbeddedStruct;

  init() {
    self.e = EmbeddedStruct{
      val1: 5,
      val2: NestedEmbedded{
        innerVal: null
      }
    };
  }
}