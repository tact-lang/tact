struct MixedDefaultsOpt {
  a: Int = 1;
  b: Bool = false;
  c: String = "default";
  d: Int?;
  e: Bool?;
  f: String?;
}

contract MixedDefaultsOptTest {
  st: MixedDefaultsOpt = MixedDefaultsOpt {
    d: null,
    e: null,
    f: null
  };
  init() {}
}