struct A {
 x: Int;
 y: Bool;
 z: String;
}

struct B {
 a1: A;
 a2: A;
}

contract DeepStructs {
 b: B;

 init() {
  self.b = B{
    a1: A{ x:1, y:true, z:"a" },
    a2: A{ x:2, y:false, z:"b" }
  };
 }
}