struct LayerOne {
  a: Int;
  b: LayerTwo;
}

struct LayerTwo {
  x: String;
  y: LayerThree;
}

struct LayerThree {
  val: Bool;
}

contract TestContract {
  data: LayerOne;

  init() {
    self.data = LayerOne{
      a: 2024,
      b: LayerTwo{
        x: "deep",
        y: LayerThree{ val: true }
      }
    };
  }
}