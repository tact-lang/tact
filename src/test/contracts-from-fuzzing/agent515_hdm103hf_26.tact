struct Alpha {
  a: Int;
}

struct Beta {
  b: Bool;
}

struct Gamma {
  g: String;
}

contract MultiStructOpt {
  alphaOpt: Alpha?;
  betaOpt: Beta?;
  gammaOpt: Gamma?;

  init() {
    self.alphaOpt = null;
    self.betaOpt = Beta{b:true};
    self.gammaOpt = null;
  }
}
