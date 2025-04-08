struct OptionalNested {
  a: Int?;
  b: Bool?;
  c: String?;
}

struct OuterWrap {
  optWrap: OptionalNested?;
  val: Int;
}

contract OptNestedTest {
  data: OuterWrap;

  init() {
    self.data = OuterWrap{optWrap:null, val:123};
  }
}