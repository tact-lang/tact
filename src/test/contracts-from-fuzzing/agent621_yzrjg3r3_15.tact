struct IntLayer {
  value: Int; 
}

struct MidLayer {
  wrapped: IntLayer;
}

struct Outer {
  container: MidLayer;
}

contract Test {
  data: Outer;

  init() {
    self.data = Outer{
      container: MidLayer{
        wrapped: IntLayer{ value:42 }
      }
    };
  }
}
