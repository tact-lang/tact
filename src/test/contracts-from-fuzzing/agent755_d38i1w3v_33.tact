struct S {
  a: Int; 
  b: Int; 
  c: Int;
}

contract DefaultInit {
  data: S = S{a:1,b:2,c:3};

  init() {
    self.data = S{a:4,b:5,c:6};
  }
}