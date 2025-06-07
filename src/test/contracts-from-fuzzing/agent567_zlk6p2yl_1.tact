struct NestedOptionalTest {
  inner_opt: Int?;
  inner_bool: Bool;
}

contract DeepNested {
  data: NestedOptionalTest?;

  init() {
    self.data = null;
  }
}