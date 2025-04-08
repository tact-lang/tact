struct Inner {
  value: Int;
}

struct Middle {
  inner: Inner?;
}

contract TestContract {
  data: Middle;

  init() {
    self.data = Middle{
      inner: null
    };
  }
}