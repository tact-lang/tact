struct Simple {
 a: Int;
}

contract NilSet {
  optStruct: Simple?;

  init() {
    self.optStruct = null;
  }
}