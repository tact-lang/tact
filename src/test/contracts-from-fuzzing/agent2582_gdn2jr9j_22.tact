struct Layer4 { v: Int; }
struct Layer3 { x: Layer4; }
struct Layer2 { y: Layer3; }
struct Layer1 { z: Layer2; }

contract Test {
  nest: Layer1;

  init() {
    self.nest = Layer1{
      z: Layer2{
        y: Layer3{
          x: Layer4{
            v: 555,
          },
        },
      },
    };
  }
}
