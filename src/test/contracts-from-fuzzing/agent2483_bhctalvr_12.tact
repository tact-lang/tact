struct S {
  a: Int as uint8 = 1;
  b: Int as int64 = -5;
  c: Bool = false;
  d: Int as uint32 = 123;
}

contract TestContract {
  myField: S = S{};
  init() {}
}