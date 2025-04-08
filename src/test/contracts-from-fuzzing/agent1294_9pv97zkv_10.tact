struct Duo {
  a: Int?;
  b: Bool;
}

contract MultiStructVars {
  x: Duo;
  y: Duo;

  init() {
    self.x = Duo{ a: null, b: true };
    self.y = Duo{ a: 10, b: false };
  }
}