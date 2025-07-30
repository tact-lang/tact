struct InnerLevel2 {
  c: Int?;
  d: String;
}

struct InnerLevel1 {
  a: Int;
  b: InnerLevel2;
}

contract MultiLayerNested {
  deep: InnerLevel1;

  init() {
    self.deep = InnerLevel1{
      a: 42,
      b: InnerLevel2{
        c: null,
        d: "Hi"
      }
    };
  }
}