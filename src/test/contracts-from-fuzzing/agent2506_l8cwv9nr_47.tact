// Test consistency of contract optional fields with message optional
message(100) M {
  a: Int?;
  b: String?;
}

contract OptMessageVars {
  var1: Int?;
  var2: String?;

  init() {
    self.var1 = null;
    self.var2 = null;
  }

  receive(msg: M) {
    self.var1 = msg.a;
    self.var2 = msg.b;
  }
}
