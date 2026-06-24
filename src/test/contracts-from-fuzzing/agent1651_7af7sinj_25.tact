struct S {
 a: Int;
 b: Int?;
 c: String;
}

contract OptionalDefault {
  val: S;

  init() {
    self.val = S{ a: 1, b: null, c: "ok" };
  }
}