struct Inner {
  val: Int?;
}

struct Wrapper {
  inner: Inner?;
}

contract OptionalInStructs {
  data: Wrapper;

  init() {
    self.data = Wrapper{ inner: null };
  }
}
