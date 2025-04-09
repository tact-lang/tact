struct DeepNestedOptional {
  a: Int?;
  b: Bool?;
  c: Int?;
}

struct Wrapper {
  inner: DeepNestedOptional?;
}

contract TestContract {
  wrapped: Wrapper;

  init() {
    self.wrapped = Wrapper{ inner: null };
  }
}