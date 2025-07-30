struct Inner {
  a: Int = 7;
  b: Bool? = true;
}

contract TestContract {
  field: Inner = Inner{};

  init() {}
}