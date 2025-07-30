struct Invalid {
  f: Int? = 3;
}

contract TestInvalid {
  i: Invalid;

  init() {
    self.i = Invalid{};
  }
}