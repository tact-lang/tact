struct InnerD {
  x: Int?;
  y: String?;
}

struct OuterD {
  i: Int;
  inner: InnerD;
}

contract NestedOpt {
  data: OuterD;

  init() {
    self.data = OuterD{
      i:1,
      inner: InnerD{
        x: null,
        y: null
      }
    };
  }
}