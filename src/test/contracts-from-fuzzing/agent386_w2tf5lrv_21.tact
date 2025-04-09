struct L1 {
 x: Int;
 y: L2;
}

struct L2 {
 a: Int;
 b: L3;
}

struct L3 {
 foo: Int;
 bar: L4;
}

struct L4 {
 p: Int;
 q: String;
}

contract DeepNest {
 top: L1 = L1{x:1,y:L2{a:2,b:L3{foo:3,bar:L4{p:4,q:"end"}}}};

 init() {
  self.top = L1{x:10,y:L2{a:20,b:L3{foo:30,bar:L4{p:40,q:"finish"}}}};
 }
}
