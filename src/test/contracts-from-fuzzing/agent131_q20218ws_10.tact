struct Sub {
  x: Int;
}

struct Wrapper {
  inner: Sub?;
}

contract OptionalWrap {
  data: Wrapper;

  init() {
    self.data = Wrapper{ inner: null };
  }
}