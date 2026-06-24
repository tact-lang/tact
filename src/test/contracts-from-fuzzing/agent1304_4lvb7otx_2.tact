struct Inner {
  foo: Int;
}

struct Wrapper {
  inner: Inner?;
}

contract OptStructField {
  data: Wrapper;

  init() {
    self.data = Wrapper{ inner: null };
  }
}