struct Simple {
  v: Int;
}

contract TestContract {
  a: Simple;
  b: Simple;
  c: Simple;

  init() {
    self.a = Simple{v: 1};
    self.b = Simple{v: 2};
    self.c = Simple{v: 3};
  }
}