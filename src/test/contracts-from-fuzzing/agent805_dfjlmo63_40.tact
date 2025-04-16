struct SBasic {
  a: Int;
  b: Bool;
}

contract BasicDefaults {
  s: SBasic = SBasic{ a: 1, b: false };

  init() {}
}
