struct Inner {
  v: Int;
}

contract OptionalFieldContract {
  data: Inner?;

  init() {
    self.data = null;
  }
}
