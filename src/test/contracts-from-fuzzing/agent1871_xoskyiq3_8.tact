struct NestedOptional {
  nested: Defaults?;
}

contract NestedOptTest {
  data: NestedOptional;

  init() {
    self.data = NestedOptional { nested: null };
  }
}

struct Defaults {
  i: Int = 0;
  b: Bool = false;
  s: String = "";
}