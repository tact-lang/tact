struct Nested {
  num: Int;
  flag: Bool;
}

contract DeepOptional {
  obj: Nested?;
  count: Int;
  active: Bool;

  init() {
    self.obj = null;
    self.count = 5;
    self.active = true;
  }
}