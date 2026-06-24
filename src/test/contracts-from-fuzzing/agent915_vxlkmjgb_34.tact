struct SBool {
  a: Bool;
}

struct SBoolOpt {
  x: Bool?;
  y: Bool?;
}

contract BoolOptions {
  normal: SBool;
  opted: SBoolOpt;

  init() {
    self.normal = SBool{ a: false };
    self.opted = SBoolOpt{ x: null, y: true };
  }
}
