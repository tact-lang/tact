struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract ManyFields {
  f1: S;
  f2: S;
  f3: S;
  f4: S;
  f5: S;

  init() {
    self.f1 = S{a:1,b:true,c:"x"};
    self.f2 = S{a:2,b:false,c:"y"};
    self.f3 = S{a:3,b:true,c:"z"};
    self.f4 = S{a:4,b:false,c:"w"};
    self.f5 = S{a:5,b:true,c:"v"};
  }
}