struct Complex {
  opt1: Int?;
  opt2: Bool?;
  nested: OptionalStruct;
}

struct OptionalStruct {
  x: Int?;
  y: Bool?;
}

contract NestedOptionalsTest {
  val: Complex;

  init() {
    self.val = Complex{
      opt1: null,
      opt2: true,
      nested: OptionalStruct{x:5, y:null}
    };
  }
}