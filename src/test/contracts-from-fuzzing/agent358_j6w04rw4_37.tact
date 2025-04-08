struct S1 { a: Int }
struct S2 { s1: S1 }

contract PersistNested {
  val: S2;
  init() {
    self.val = S2{
      s1: S1{ a: 42 }
    };
  }
}