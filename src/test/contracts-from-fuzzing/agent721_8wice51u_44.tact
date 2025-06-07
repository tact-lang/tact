struct SomeStruct {
  i: Int;
  opt: Bool?;
}

contract AssignInInit {
  s: SomeStruct;
  init() {
    self.s = SomeStruct{ i: 2, opt: null };
  }
}