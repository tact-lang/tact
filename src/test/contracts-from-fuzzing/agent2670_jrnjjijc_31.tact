struct NestedOptStruct {
  nested: OptStruct?;
}

struct OptStruct {
  field: Int?;
}

contract NestedOptStructTest {
  val: NestedOptStruct;

  init() {
    self.val = NestedOptStruct{ nested: null };
  }
}