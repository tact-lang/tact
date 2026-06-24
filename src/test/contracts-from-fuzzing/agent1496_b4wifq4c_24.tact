struct IntContainer {
  x: Int;
}

contract MultiDefaultInt {
  a: IntContainer = IntContainer{x:1};
  b: IntContainer = IntContainer{x:2};
  c: IntContainer = IntContainer{x:3};
  
  init() {
    self.a = IntContainer{x:1};
    self.b = IntContainer{x:2};
    self.c = IntContainer{x:3};
  }
}