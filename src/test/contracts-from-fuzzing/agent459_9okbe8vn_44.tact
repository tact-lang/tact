struct A {
  intField: Int;
  strField: String;
}

contract AOptionalStruct {
  aOpt: A?;

  init() {
    self.aOpt = null;
  }
}