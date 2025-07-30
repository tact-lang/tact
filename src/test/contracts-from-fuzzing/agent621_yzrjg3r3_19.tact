struct TwoLayers {
  a: FirstLayer;
}

struct FirstLayer {
  b: SecondLayer;
}

struct SecondLayer {
  val1: Int;
  val2: Bool;
  val3: String;
}

contract Test {
  d: TwoLayers;

  init() {
    self.d = TwoLayers{
      a: FirstLayer{
        b: SecondLayer{
          val1:42,
          val2:false,
          val3:"hello"
        }
      }
    };
  }
}
