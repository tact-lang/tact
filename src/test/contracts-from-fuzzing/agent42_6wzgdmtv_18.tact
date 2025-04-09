struct S {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalInit {
  s: S;

  init() {
    self.s = S{ a:null, b:null, c:null };
  }
}