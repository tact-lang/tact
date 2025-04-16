struct SubStruct { a: Int; }

contract OptNullSubStruct {
  sub: SubStruct?;

  init() {
    self.sub = null;
  }
}