struct One {
  a: Int;
  b: String;
  c: Bool;
}

struct Two {
  x: Int;
  y: String?;
  z: Bool;
}

contract MultiStructs {
  s1: One;
  s2: Two;

  init() {
    self.s1 = One{a:1,b:"s1",c:true};
    self.s2 = Two{x:5,y:null,z:false};
  }
}