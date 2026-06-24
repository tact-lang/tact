// deeply nested optional struct inside optional inside optional
struct InnerMost { q: Int; }
struct Mid { p: InnerMost?; }

contract OptInOptInOpt {
  a: Mid?;

  init() {
    self.a = null;
  }
}
