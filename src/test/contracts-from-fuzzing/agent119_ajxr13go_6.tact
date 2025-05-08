struct NestedOptional {
  sub: SubStruct?;
}

struct SubStruct {
  val: Int;
  flag: Bool;
}

contract OptionalNestedTest {
  s: NestedOptional;

  init() {
    self.s = NestedOptional{sub: null};
  }
}