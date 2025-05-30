struct NestedDefaults {
  a: Int = 1;
  b: Bool = false;
  c: String = "foo";
}

contract DefaultsInStructStorage {
  val: NestedDefaults = NestedDefaults{};
}