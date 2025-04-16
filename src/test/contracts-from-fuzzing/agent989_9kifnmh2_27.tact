struct Inner1 {
  a: Int;
}

struct Inner2 {
  b: Bool;
}

struct Combo {
  one: Inner1;
  two: Inner2;
}

contract MultiStructs {
  field: Combo;

  init() {
    self.field = Combo{
      one: Inner1{ a: 10 },
      two: Inner2{ b: true }
    };
  }
}