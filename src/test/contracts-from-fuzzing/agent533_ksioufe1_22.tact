struct InnerStr {
  s: String;
}
struct OuterStr {
  inner: InnerStr;
}

contract NestedString {
  val: OuterStr;

  init() {
    self.val = OuterStr{ inner: InnerStr{s:"nested"} };
  }
}