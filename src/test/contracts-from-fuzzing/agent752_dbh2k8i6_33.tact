struct NestedNulls {
  i: Int?;
  b: Bool?;
  s: String?;
}

contract DeepOptionals {
  val: NestedNulls?;
  init() {
    self.val = null;
  }
}