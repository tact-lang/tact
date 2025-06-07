struct Alpha { a: Int }
struct Beta { b: Int }
struct Gamma { c: Int }
struct Delta { d: Int }
struct Epsilon { e: Int }

struct HugeContainer {
  alpha: Alpha;
  beta: Beta;
  gamma: Gamma;
  delta: Delta;
  epsilon: Epsilon;
}

contract ManyEmbedded {
  state: HugeContainer;

  init() {
    self.state = HugeContainer{
      alpha: Alpha{a:1},
      beta: Beta{b:2},
      gamma: Gamma{c:3},
      delta: Delta{d:4},
      epsilon: Epsilon{e:5}
    };
  }
}