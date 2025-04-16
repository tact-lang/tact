struct Ints {
  i1: Int;
  i2: Int;
  i3: Int;
}
struct Bools {
  b1: Bool;
  b2: Bool;
}
struct Strings {
  s1: String;
  s2: String;
}

struct Wrapper {
  ints: Ints;
  bools: Bools;
  strings: Strings;
}

contract Test {
  d: Wrapper;
  init() {
    self.d = Wrapper{
      ints: Ints{ i1:1, i2:2, i3:3 },
      bools: Bools{ b1:true, b2:false },
      strings: Strings{ s1:"x", s2:"y" },
    };
  }
}
