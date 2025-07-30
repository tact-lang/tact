struct Inner {
  z: Int;
}

struct Outer {
  x: Int;
  y: Inner;
}

contract ManyNested {
  o1: Outer;
  o2: Outer;
  o3: Outer;
  o4: Outer;

  init() {
    self.o1 = Outer{x:1,y:Inner{z:11}};
    self.o2 = Outer{x:2,y:Inner{z:22}};
    self.o3 = Outer{x:3,y:Inner{z:33}};
    self.o4 = Outer{x:4,y:Inner{z:44}};
  }
}