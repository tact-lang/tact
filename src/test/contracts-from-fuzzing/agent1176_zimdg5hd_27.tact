struct OptStrs {
  s1: String? = null; s2: String? = null; s3: String? = null;
}

contract DefaultNullStrs {
  data: OptStrs;

  init() {
    self.data = OptStrs{};
  }
}