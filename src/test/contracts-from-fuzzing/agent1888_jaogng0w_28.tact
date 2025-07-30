struct A {
  x: Int?;
  y: Bool?;
  z: String?;
}

struct B {
  a1: A;
  a2: A;
  val: Int;
}

struct C {
  b1: B;
  b2: B;
  flag: Bool;
}

contract DeepOpt {
  data: C;

  init() {
    self.data = C{
      b1: B{ a1:A{x:null,y:true,z:null}, a2:A{x:22,y:null,z:"yes"}, val:1 },
      b2: B{ a1:A{x:5,y:false,z:"no"}, a2:A{x:null,y:null,z:null}, val:2 },
      flag: true
    };
  }
}
