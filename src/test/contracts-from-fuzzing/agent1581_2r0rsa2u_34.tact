struct NestedOptInt {
  val: Int?;
}

struct Wrapper {
  inside: NestedOptInt?;
}

contract OptWrap {
  storage: Wrapper;

  init() {
    self.storage = Wrapper{
      inside: null,
    };
  }
}