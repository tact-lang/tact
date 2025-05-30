struct Deep2 { z: Int }
struct Deep1 { y: Deep2 }
struct Root { x: Deep1 }

contract TestContract {
  nested: Root;
  
  init() {
    self.nested = Root{
      x: Deep1{
        y: Deep2{ z: 99 }
      }
    };
  }
}