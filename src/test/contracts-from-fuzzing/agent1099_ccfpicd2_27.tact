struct R {
  k: Int;
}

struct Q {
  r: R;
}

struct P {
  q: Q;
}

struct O {
  p: P;
}

contract ManyLayers {
  nest: O;

  init() {
    self.nest = O{
      p: P{
        q: Q{
          r: R{
            k: 777
          }
        }
      }
    };
  }
}