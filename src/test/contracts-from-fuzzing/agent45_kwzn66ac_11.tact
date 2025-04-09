struct InnerMost { val: Int?; }
struct Mid { inner: InnerMost?; }
struct Outer { mid: Mid?; }

contract OptChain {
  field: Outer;

  init() {
    self.field = Outer {
      mid: Mid {
        inner: InnerMost {
          val: null
        }
      }
    };
  }
}