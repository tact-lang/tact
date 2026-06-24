struct WeirdOrder {
  b: Bool;
  a: Int;
  c: String;
}

contract OrderMatters {
  data: WeirdOrder;

  init() {
    self.data = WeirdOrder{
      b: false,
      a: 77,
      c: "end"
    };
  }
}