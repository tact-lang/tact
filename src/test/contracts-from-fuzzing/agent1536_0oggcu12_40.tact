// Insert an optional struct with optional inside optional
struct Level {
  foo: Int?;
}

contract WrappedOpt {
  nestedOpt: Level?;

  init() {
    self.nestedOpt = null;
  }
}