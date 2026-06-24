// fuzz unusual serialization widths with nested optionals
struct SerOpt {
  x: Int? as uint4;
  y: Int? as int7;
}

contract TestContract {
  s: SerOpt;

  init() {
    self.s = SerOpt{
      x: null,
      y: null
    };
  }
}