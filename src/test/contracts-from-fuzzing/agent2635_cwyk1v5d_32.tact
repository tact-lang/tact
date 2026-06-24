struct Alpha { x: Int }
struct Beta { y: Int }
struct Gamma { z: Int }

struct Omega {
  a: Alpha;
  b: Beta;
  c: Gamma;
}

contract Sandwich {
  inner: Omega;
  
  init() {
    self.inner = Omega{
      a: Alpha{ x:1 },
      b: Beta{ y:2 },
      c: Gamma{ z:3 }
    };
  }
}