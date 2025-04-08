// optional nested slices
struct SliceWrap { s: Slice?; }
struct Outer {
  inner: SliceWrap?;
}

contract TestContract {
  store: Outer;

  init() {
    self.store = Outer {
      inner: SliceWrap {
        s: null
      }
    };
  }
}