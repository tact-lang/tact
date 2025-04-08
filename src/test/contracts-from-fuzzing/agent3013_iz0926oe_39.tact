struct Simple {
  f: Int;
}

contract ManySimple {
  f1: Simple;
  f2: Simple;
  f3: Simple;
  f4: Simple;
  f5: Simple;

  init() {
    self.f1 = Simple{f:1};
    self.f2 = Simple{f:2};
    self.f3 = Simple{f:3};
    self.f4 = Simple{f:4};
    self.f5 = Simple{f:5};
  }
}
