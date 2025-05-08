struct Sub1 {
 foo: Int?;
 bar: Bool?;
}
struct Sub2 {
 baz: String?;
 qux: Bool?;
}
struct Top {
 s1: Sub1?;
 s2: Sub2?;
}

contract DeepOptional {
  val: Top;

  init() {
    self.val = Top { s1: null, s2: null };
  }
}