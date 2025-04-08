struct S1 { a: Int; }
struct S2 { b: String; s1: S1; }

contract OptNested {
  val: S2?;

  init() {
    self.val = S2{ b:"s", s1:S1{a:1} };
  }
}