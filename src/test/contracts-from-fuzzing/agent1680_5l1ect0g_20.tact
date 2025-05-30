struct Simple {
  flag: Bool;
}

contract OnlyOne {
  simple: Simple;

  init() {
    self.simple = Simple{flag: true};
  }
}