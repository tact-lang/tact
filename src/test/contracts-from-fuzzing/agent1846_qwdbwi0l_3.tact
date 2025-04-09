struct Inner {
  a: Int = 1;
}

struct Outer {
  b: Inner? = null;
  c: Bool = true;
}

contract NestedOptionalStruct {
  data: Outer = Outer{};
}