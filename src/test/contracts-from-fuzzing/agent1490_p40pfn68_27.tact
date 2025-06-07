struct SA { a: Int; }
struct SB { b: Int; }
struct Some {
  sa: SA;
  sb: SB;
}

contract NestedAssigned {
  s: Some;

  init() {
    self.s = Some{
      sa: SA{ a: 4 },
      sb: SB{ b: 5 }
    };
  }
}