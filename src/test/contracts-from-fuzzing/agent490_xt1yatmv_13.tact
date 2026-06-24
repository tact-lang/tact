struct NestedDefault {
  val: Int = 77;
  str: String = "nested";
}

struct OuterDefault {
  nest: NestedDefault = NestedDefault{};
  flag: Bool = false;
}

contract TestContract {
  d: OuterDefault;
  
  init() {
    self.d = OuterDefault{};
  }
}