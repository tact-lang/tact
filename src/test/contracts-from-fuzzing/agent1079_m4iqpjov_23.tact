struct WrappedPrimitives {
  i: Int;
  b: Bool;
  s: String;
}

struct OuterWrap {
  wp: WrappedPrimitives;
}

contract StructWrap {
  val: OuterWrap;

  init() {
    self.val = OuterWrap{
      wp: WrappedPrimitives{
        i: 10,
        b: false,
        s: "hello",
      }
    };
  }
}