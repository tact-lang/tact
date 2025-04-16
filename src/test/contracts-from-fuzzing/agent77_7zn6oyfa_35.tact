// Test struct with field order clash (non-optional after optional)
struct WeirdOrder {
  a: Int?;
  b: Int;
  c: Int?;
}

contract OrderTest {
  val: WeirdOrder;
  init() {
    self.val = WeirdOrder { a:null, b:42, c:null };
  }
}