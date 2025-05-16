struct Deep {
  a: Int?;
  b: Int?;
  c: Int?;
}

struct Middle {
  d: Deep;
  e: Int?;
  f: Bool;
}

contract ManyNestedOptionals {
  m: Middle;

  init() {
    self.m = Middle{
      d: Deep{a:null, b:1, c:null},
      e:2,
      f:true
    };
  }
}