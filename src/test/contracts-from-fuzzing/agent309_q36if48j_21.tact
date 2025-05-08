struct NestedString {
  s: String;
}

struct WrapNested {
  x: Int;
  inner: NestedString;
}

contract DeepStringEmbed {
  w: WrapNested;

  init() {
    self.w = WrapNested{
      x:1,
      inner: NestedString{s: "hello"}
    };
  }
}