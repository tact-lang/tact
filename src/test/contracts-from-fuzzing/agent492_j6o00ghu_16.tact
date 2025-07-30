struct Middle {
   one: Inner;
   two: Inner;
   three: Inner?;
}

struct Inner {
  i: Int;
  s: String?;
}

contract NestedLevelsOptional {
  base: Middle;

  init() {
    self.base = Middle{
      one: Inner{i:1,s:null},
      two: Inner{i:2,s:null},
      three: null
    };
  }
}
