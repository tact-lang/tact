struct SM {
  a: Int;
}

contract DeepOptAssign {
  v1: SM? = null;
  v2: SM?;

  init() {
    self.v2 = null;
  }
}