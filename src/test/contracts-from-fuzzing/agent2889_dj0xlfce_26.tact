struct S {
  a: Int;
  b: Bool;
}

contract ListStructs {
  one: S;
  two: S;

  init() {
    self.one = S{ a:1, b:false };
    self.two = S{ a:2, b:true };
  }
}