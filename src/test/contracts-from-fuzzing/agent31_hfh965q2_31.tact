struct NestedOnce {
  x: Int;
  y: Int?;
}

struct Combine {
  inner1: NestedOnce;
  inner2: NestedOnce;
}

contract Test {
  combo: Combine;

  init() {
    self.combo = Combine{
      inner1: NestedOnce{x:1,y:null},
      inner2: NestedOnce{x:2,y:null}
    };
  }
}