struct Simple {
  a: Int;
}

contract ManySimples {
  f1: Simple; f2: Simple; f3: Simple; f4: Simple; f5: Simple;

  init() {
    self.f1 = Simple{a:1}; self.f2 = Simple{a:2}; self.f3 = Simple{a:3}; self.f4 = Simple{a:4}; self.f5 = Simple{a:5};
  }
}
