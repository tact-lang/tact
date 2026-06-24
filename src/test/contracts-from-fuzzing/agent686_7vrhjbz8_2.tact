struct Inner {
  a: Int = 7;
  b: Bool?; 
}

contract TestContract {
  field: Inner = Inner{};

  init() {}
}