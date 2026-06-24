struct LargeNested2 {
  i1: Int; i2: Int; i3: Int; i4: Int; 
  s1: String; s2: String; 
  b1: Bool; b2: Bool;
}

struct LargeNested1 {
  nested: LargeNested2;
  flag: Bool;
}

contract DoubleNested {
  big: LargeNested1;
  init() {
    self.big = LargeNested1{
      nested: LargeNested2{
        i1: 1, i2: 2, i3: 3, i4: 4,
        s1: "x", s2: "y",
        b1: true, b2: false
      },
      flag: true
    };
  }
}