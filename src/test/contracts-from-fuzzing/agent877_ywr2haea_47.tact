// Persistent field is an optional struct whose optional inner field is default null
struct Inner {
  flag: Bool?;
}

contract NullDefaultChain {
  i: Inner?;

  init() {
    self.i = null;
  }
}