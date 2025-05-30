contract OnlyStructOptional {
  s: Inner?;

  init() {
    self.s = null;
  }
}

struct Inner {
  x: Int;
}