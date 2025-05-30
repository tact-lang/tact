struct JustBool {
  flag: Bool;
}

contract SingleNestedBool {
  v: JustBool;
  init() {
    self.v = JustBool{ flag: true };
  }
}