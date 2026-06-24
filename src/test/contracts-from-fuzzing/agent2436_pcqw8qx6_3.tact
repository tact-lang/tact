struct A {
  x: Int;
  y: Bool;
  z: String;
}

contract C {
  a1: A;
  a2: A;
  a3: A;

  init() {
    self.a1 = A{x:1, y:true, z:"1"};
    self.a2 = A{x:2, y:false, z:"2"};
    self.a3 = A{x:3, y:true, z:"3"};
  }
}