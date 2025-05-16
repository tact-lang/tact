struct InnerOpt {
  s: String?;
  i: Int?;
}

struct MiddleOpt {
  inner: InnerOpt?;
}

struct OuterOpt {
  middle: MiddleOpt?;
}

contract MultiNullable {
  complexOpt: OuterOpt?;

  init() {
    self.complexOpt = null;
  }
}