struct Nest {
  a: Int;
  b: Bool;
}

struct OptNest {
  f: Nest?;
}

contract OptNestPersist {
  o: OptNest;
  init() {
    self.o = OptNest{ f: null };
  }
}