struct S {
  a: Int;
  b: Bool;
}

contract MultiVar {
  v1: Int;
  v2: String;
  v3: Bool;
  v4: S;

  init() {
    self.v1 = 1;
    self.v2 = "hello";
    self.v3 = false;
    self.v4 = S { a: 10, b: true };
  }
}