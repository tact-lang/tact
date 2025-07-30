struct OptionalMiddle {
  a: Int;
  b: Int?;
  c: Int;
}

struct NestedWrap {
  inner: OptionalMiddle;
  end: String;
}

contract Test {
  data: NestedWrap;
  init() {
    self.data = NestedWrap{
      inner: OptionalMiddle{a:1, b:null, c:3},
      end: "hi"
    };
  }
}