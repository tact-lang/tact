struct Level {
  val: Int?; // implicitly null by default
}

contract ImplicitNullDefault {
  st: Level;

  init() {
    self.st = Level{};
  }
}
