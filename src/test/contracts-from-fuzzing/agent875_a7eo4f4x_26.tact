struct DeepLayers {
  a: Layer1;
}

struct Layer1 {
  b: Layer2;
}

struct Layer2 {
  c: Layer3;
}

struct Layer3 {
  d: Layer4;
}

struct Layer4 {
  val: Int;
  optFlag: Bool?;
}

contract DeepLayersTest {
  x: DeepLayers;
  init() {
    self.x = DeepLayers{
      a: Layer1{
        b: Layer2{
          c: Layer3{
            d: Layer4{
              val: 18,
              optFlag: null
            }
          }
        }
      }
    };
  }
}