struct A {
 x: Int;
 y: Bool;
}

struct B {
 z: Int;
 w: A;
}

struct C {
 u: B;
 v: String;
}

contract MultiNested {
  data: C;
  init() {
    self.data = C{
      u: B{z: 42, w: A{x:1,y:false}},
      v: "hi"
    };
  }
}
