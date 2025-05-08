struct S {
  a: Int;
  b: Int?;
}
contract OptBeforeInit {
  s: S;
  init() {
    self.s = S{a:5,b:null};
  }
  get fun getB(): Int? { return self.s.b; }
}