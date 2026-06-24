// Extremely deep nested structs with options
struct D1 { x: Int; }
struct D2 { x: D1; }
struct D3 { x: D2; }
struct D4 { x: D3; }
struct D5 { x: D4; }
struct D6 { x: D5; }
struct D7 { x: D6; }
struct D8 { x: D7; }
struct D9 { x: D8; }
struct D10 { x: D9; }

contract Test {
  data: D10;

  init() {
    self.data = D10{
      x: D9{x: D8{x: D7{x: D6{x: D5{x: D4{x: D3{x: D2{x: D1{x: 1}}}}}}}}}
    };
  }
}