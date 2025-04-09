struct MultiLayer {
  val1: Int;
  opt1: Int?;
  inner: InnerLayer;
}

struct InnerLayer {
  val2: Int;
  opt2: String?;
}

contract StructsInStruct {
  m: MultiLayer;

  init() {
    self.m = MultiLayer{
      val1:1,
      opt1:null,
      inner: InnerLayer{
        val2:2,
        opt2:null
      }
    };
  }
}