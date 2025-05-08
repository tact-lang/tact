struct NestedDefaults {
  a: Int = 1;
  b: Int = 2;
}

struct UseDefaults {
  inner: NestedDefaults = NestedDefaults{};
}

contract StructNestedDefaults {
  val: UseDefaults = UseDefaults{};
}
