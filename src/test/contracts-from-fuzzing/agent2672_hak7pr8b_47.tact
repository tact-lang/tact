struct S {
 a: Int;
 b: Bool?;
 c: String?;
}

contract DefUninitOpt {
 s: S;
 init() {
  self.s = S { a: 7, b: null, c: null };
 }
}