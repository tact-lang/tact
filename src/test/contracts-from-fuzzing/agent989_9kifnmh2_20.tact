struct O1 {
  foo: Int?;
}

struct O2 {
  foo: O1?;
}

struct O3 {
  foo: O2?;
}

contract ThreeOpt {
  data: O3;

  init() {
    self.data = O3{ foo: O2{ foo: O1{ foo: null } } };
  }
}