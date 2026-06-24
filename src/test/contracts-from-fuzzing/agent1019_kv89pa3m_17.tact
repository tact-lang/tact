struct Rec1 { a: Int; }
struct Rec2 { b: Int; inner: Rec1; }
struct Rec3 { c: Int; inner: Rec2; }

contract RecursiveLike {
  val: Rec3;

  init() {
    self.val = Rec3{ c:3, inner: Rec2{ b:2, inner: Rec1{ a:1 } } };
  }
}
