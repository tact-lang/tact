struct Inner {
  a: Int = 1;
  b: Int = 2;
}

struct Outer {
  tag: String = "";
  nested: Inner = Inner{};
}

contract OverridePartial {
  val: Outer = Outer{
    nested: Inner{ a: 99 }
  };
}