struct NestedDefaults {
  a: Int = 1;
  b: Bool = true;
}

struct OuterDef {
  inner: NestedDefaults = NestedDefaults{};
}

contract OuterNestDef {
  data: OuterDef = OuterDef{};
}