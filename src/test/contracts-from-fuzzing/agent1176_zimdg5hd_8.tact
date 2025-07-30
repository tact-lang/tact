struct Alpha {
  val: Int = 7;
}

struct Beta {
  flag: Bool = true;
  innerOpt: Alpha?;
}

struct Gamma {
  txt: String;
  betaOpt: Beta?;
}

contract MultiInit {
  g: Gamma;
  betaField: Beta;

  init() {
    self.g = Gamma{
      txt: "zzz",
      betaOpt: Beta{ flag: false, innerOpt: Alpha{} }
    };

    self.betaField = Beta{ flag: true, innerOpt: null };
  }
}