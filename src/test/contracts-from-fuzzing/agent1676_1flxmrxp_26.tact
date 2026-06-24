struct InnerDefault {
  c: Int = 2;
  d: String = "s";
}

struct Outer {
  inner: InnerDefault;
}

contract ExplicitNested {
  val: Outer;

  init() {
    self.val = Outer{
      inner: InnerDefault{}
    };
  }
}