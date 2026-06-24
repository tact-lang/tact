struct Defaults {
  a: Int = 1;
  b: Int = 2;
  c: Int = 3;
  d: Int = 4;
}

contract DefaultsOverwrite {
  f: Defaults;

  init() {
    self.f = Defaults{
      a: 100,
      b: 200,
      c: 300,
      d: 400
    };
  }
}
