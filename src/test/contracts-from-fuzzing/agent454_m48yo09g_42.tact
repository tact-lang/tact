struct ChildStruct {
  i: Int;
  flag: Bool;
  str: String;
}

contract OptionalChildStruct {
  child: ChildStruct?;
  init() {
    self.child = null;
  }
}