struct N1 { x: Int; }
struct N2 { x: Int; y: N1; }
struct N3 { x: Int; y: N2; }
struct N4 { x: Int; y: N3; }

contract TreeStruct {
  data: N4;

  init() {
    self.data = N4{
      x:1,
      y: N3{
        x:2,
        y: N2{
          x:3,
          y: N1{ x:4 }
        }
      }
    };
  }
}