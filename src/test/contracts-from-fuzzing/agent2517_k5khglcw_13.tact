struct Deepest {
  val: Int?;
}

struct InnerOpt {
  nested: Deepest?;
}

struct OuterOpt {
  wrapped: InnerOpt?;
}

contract Test {
  data: OuterOpt?;

  init() {
    self.data = null;
  }
}