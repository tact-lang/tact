// Test unusual ordering of different optional types inside struct
struct WeirdOrder {
  s: String?;
  i: Int;
  b: Bool?;
  a: Address;
}

contract WeirdOrderTest {
  data: WeirdOrder;

  init() {
    self.data = WeirdOrder{
      s: null,
      i: 42,
      b: true,
      a: myAddress()
    };
  }
}