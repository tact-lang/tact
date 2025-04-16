struct Alpha { a: Int; }
struct Beta { b: Bool; }
struct Gamma { c: String; }
struct Delta { d: Int?; }

struct Mix {
  alpha: Alpha;
  beta: Beta;
  gamma: Gamma;
  delta: Delta;
}

contract MixedStructs {
  val: Mix;

  init() {
    self.val = Mix {
      alpha: Alpha{a:1},
      beta: Beta{b:true},
      gamma: Gamma{c:""},
      delta: Delta{d:null}
    };
  }
}