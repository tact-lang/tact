struct DeepOptionals {
  a: Int?;
  b: Inner?;
}

struct Inner {
  x: Int?;
  y: String?;
}

contract DeepOptTest {
  info: DeepOptionals;

  init() {
    self.info = DeepOptionals{
      a: null,
      b: Inner{ x:null, y:null }
    };
  }
}
