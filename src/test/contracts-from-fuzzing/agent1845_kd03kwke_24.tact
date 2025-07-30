// Nested optional struct with explicit null init
struct SmallOpt {
  foo: Int?;
}

contract NestedOptInit {
  val: SmallOpt?;
  init() {
    self.val = null;
  }
}
