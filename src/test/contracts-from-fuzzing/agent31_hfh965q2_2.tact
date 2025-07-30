struct Nested {
  val: Int;
  flag: Bool;
}

struct Outer {
  nested: Nested;
  ok: Bool;
}

contract Test {
  persist: Outer;

  init() {
    self.persist = Outer{
      nested: Nested{val: 42, flag: false},
      ok: true
    };
  }
}