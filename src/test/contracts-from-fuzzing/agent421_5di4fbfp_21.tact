struct NestedOpt {
  val: Int?;
}

struct OuterOpt {
  inner: NestedOpt?;
}

contract NullTest {
  o: OuterOpt?;

  init() {
    self.o = null;
  }
}