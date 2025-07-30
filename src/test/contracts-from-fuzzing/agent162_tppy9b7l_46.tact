struct InnerS { s: String }
struct OuterS { inner: InnerS }
contract NestedStructStrings {
  d: OuterS;
  init() {
    self.d = OuterS{
      inner: InnerS{ s: "xyz" }
    };
  }
}