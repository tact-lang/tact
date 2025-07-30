struct Ints {
 a: Int;
 b: Int;
}

struct Bools {
 x: Bool;
 y: Bool;
}

struct Strings {
 s1: String;
 s2: String;
}

contract MultiStructs {
  ints: Ints;
  bools: Bools;
  strings: Strings;

  init() {
    self.ints = Ints{a:1,b:2};
    self.bools = Bools{x:true,y:false};
    self.strings = Strings{s1:"foo",s2:"bar"};
  }
}