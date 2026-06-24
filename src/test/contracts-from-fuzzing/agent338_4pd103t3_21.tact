struct Inner {
  prefix: Int = 0;
  tail: Slice as remaining;
}

struct Wrapper {
  first: Int;
  inner: Inner?;
}

contract TestContract {
  data: Wrapper;

  init() {
    self.data = Wrapper{
      first: 5,
      inner: null
    };
  }
}