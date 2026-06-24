struct LayerA {
  a: Int;
  b: Bool;
}

struct LayerB {
  la: LayerA;
  s: String;
}

contract MultiLayered {
  val: LayerB;

  init() {
    self.val = LayerB{
      la: LayerA{a:1, b:false},
      s:"string"
    };
  }
}