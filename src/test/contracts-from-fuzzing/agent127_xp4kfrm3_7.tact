struct A {
  x: Int;
}

struct B {
  y: Int;
  z: A;
}

struct C {
  a: A;
  b: B;
  flag: Bool;
  text: String;
}

contract NestedManyFields {
  content: C;
  init() {
    self.content = C{
      a: A{x:1},
      b: B{y:2,z:A{x:3}},
      flag:true,
      text:"ok"
    };
  }
}