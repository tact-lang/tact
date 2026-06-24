struct Ints {
  x: Int;
  y: Int as uint8;
  z: Int as int64;
}

struct Strings {
  s1: String;
  s2: String?;
}

struct Booleans {
  b1: Bool;
  b2: Bool?;
}

contract MixedAll {
    ints: Ints;
    strs: Strings;
    bools: Booleans;

    init() {
        self.ints = Ints{ x: 1, y: 2, z: 3 };
        self.strs = Strings{ s1: "hi", s2: null };
        self.bools = Booleans{ b1:true, b2:null };
    }
}