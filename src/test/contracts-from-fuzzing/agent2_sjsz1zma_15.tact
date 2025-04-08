struct NestedDefaults {
  a: Int = 1;
  b: Bool = false;
}

struct OuterDefaults {
  inner: NestedDefaults = NestedDefaults{};
  c: Bool = true;
}

contract DefaultInit {
  data: OuterDefaults = OuterDefaults{};
}