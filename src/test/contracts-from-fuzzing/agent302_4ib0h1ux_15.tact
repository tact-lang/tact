struct Middle {
  a: Int;
  b: Bool;
}

contract StructArr {
  first: Middle;
  second: Middle;
  third: Middle;

  init() {
    self.first = Middle{a:1,b:true};
    self.second = Middle{a:2,b:false};
    self.third = Middle{a:3,b:true};
  }
}