struct S {
  a: Int;
  b: Bool;
  c: String;
}

contract Ordering {
  s1: S;
  s2: S;
  i: Int;

  init() {
    self.s1 = S{a:1,b:true,c:"x"};
    self.s2 = S{a:2,b:false,c:"y"};
    self.i = 5;
  }
}