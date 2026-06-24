struct S1 { x: Int; }
struct S2 { y: Int; }
struct Container {
 s1: S1;
 s2: S2;
}

contract MultiStructContain {
  val: Container;
  init(){
    self.val = Container{
      s1: S1{ x: 1 },
      s2: S2{ y: 2 }
    };
  }
}