struct Alpha {
  x: Int = 1;
}

struct Beta {
  y: Bool = false;
}

struct Gamma {
  z: String = "g";
}

contract TestContract {
  a: Alpha = Alpha{};
  b: Beta = Beta{};
  c: Gamma = Gamma{};
  init() {}
}