struct NestedDefaults {
  a: Int = 1;
  b: Bool = false;
}

struct Container {
  nested: NestedDefaults = NestedDefaults{};
  num: Int = 42;
}

contract NestedAndDefaults {
  c: Container = Container{};
}