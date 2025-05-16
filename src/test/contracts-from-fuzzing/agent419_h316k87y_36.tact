// nested with subtype defaults
struct Inner {
  s: String = "ok";
}

contract DefaultNest {
  f: Inner;

  init() {
    self.f = Inner{ s: "ok" };
  }
}