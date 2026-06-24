struct NestedString {
  s: String;
}

contract DeepString {
  f: NestedString;

  init() {
    self.f = NestedString{
      s: "deepstr",
    };
  }
}