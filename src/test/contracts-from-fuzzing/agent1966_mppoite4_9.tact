struct NestedString {
  inner: Inner;
}

struct Inner {
  s: String;
}

contract StringInsideNestedStruct {
  data: NestedString;

  init() {
    self.data = NestedString{
      inner: Inner{ s: "deep string" }
    };
  }
}
