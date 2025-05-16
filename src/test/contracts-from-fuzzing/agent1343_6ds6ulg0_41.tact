contract WrongSerializeAssign {
  f: Int as uint4;
  init() {
    self.f = 123;
  }
}
