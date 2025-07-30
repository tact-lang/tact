struct S {
  intField: Int;
  boolField: Bool;
  stringField: String;
}

contract StructField {
  s: S;

  init() {
    self.s = S{intField:1, boolField:true, stringField:"hi"};
  }
}