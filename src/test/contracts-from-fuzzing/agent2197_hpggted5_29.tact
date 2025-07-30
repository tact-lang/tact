struct DeepNestOpt {
  x: Int;
  y: Bool;
}

struct Wrapper {
  v: DeepNestOpt?;
}

contract C {
  wrapped: Wrapper;

  init() {
    self.wrapped = Wrapper{ v: null };
  }
}