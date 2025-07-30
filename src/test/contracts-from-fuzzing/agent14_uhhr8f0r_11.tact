struct InnerOpt {
  s: String?;
  i: Int?;
  b: Bool?;
}

contract Test {
    inner: InnerOpt?;

    init() {
        self.inner = null;
    }
}