// optional nested inside
struct Inner {
  a: Int?;
  b: Bool?;
}

struct Wrapper {
  inner: Inner?;
}

contract OptInnerOpt {
  data: Wrapper;
  init() {
    self.data = Wrapper {
      inner: null
    };
  }
}