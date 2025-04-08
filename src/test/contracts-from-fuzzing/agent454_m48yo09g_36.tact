struct Mid {
  val: Int;
}

struct Outer {
  m1: Mid;
  m2: Mid;
}

contract RedundantNested {
  o: Outer;
  init() {
    self.o = Outer{ m1: Mid{val:1}, m2: Mid{val:2} };
  }
}