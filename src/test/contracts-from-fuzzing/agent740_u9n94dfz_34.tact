struct NestedBool {
  x: Int;
  y: NestedOptionalBool?;
}

struct NestedOptionalBool {
  flag: Bool?;
}

contract NestedBoolTest {
  val: NestedBool;
  init() {
    self.val = NestedBool{ x:1, y:null };
  }
}