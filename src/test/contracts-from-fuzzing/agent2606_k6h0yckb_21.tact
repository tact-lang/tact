struct DeepOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  d: Cell?;
  e: Slice?;
}

struct Layer2 {
  inner: DeepOptionals;
}

struct Layer3 {
  l2: Layer2;
}

contract DeepOptTest {
  val: Layer3;

  init() {
    self.val = Layer3{
      l2: Layer2{
        inner: DeepOptionals{
          a: null,
          b: null,
          c: null,
          d: null,
          e: null
        }
      }
    };
  }
}