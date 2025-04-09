// Struct with optional nested struct with defaults
struct Defaults {
  x: Int = 5;
  y: Bool = true;
}

struct Maybe {
  d: Defaults?;
}

contract DefaultOpt {
  m: Maybe;
  init() {
    self.m = Maybe { d: null };
  }
}