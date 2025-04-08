struct S {
  nested: S2;
}

struct S2 {
  flag: Bool;
  count: Int;
}

contract C {
  val: S;

  init() {
    self.val = S{
      nested: S2{
        flag: true,
        count: 42
      }
    };
  }
}