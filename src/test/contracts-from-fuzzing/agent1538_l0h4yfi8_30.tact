struct NullableNested {
 inner: Inner?;
}

struct Inner {
 a: Int;
 b: Bool;
}

contract Test {
  data: NullableNested;

  init() {
    self.data = NullableNested{
      inner: Inner{ a: 5, b: false }
    };
  }
}