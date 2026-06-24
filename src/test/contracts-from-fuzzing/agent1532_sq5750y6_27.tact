struct S {
  a: Int;
  b: Bool?;
}

contract OptPerm {
  one: S;
  two: S;
  three: S;
  four: S;

  init() {
    self.one = S{a:1,b:true};
    self.two = S{a:2,b:null};
    self.three = S{a:3,b:false};
    self.four = S{a:4,b:null};
  }
}