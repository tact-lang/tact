struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct Container {
  va: A;
  vb: B;
  vc: C;
}

contract ContainerTest {
  myStruct: Container;

  init() {
    self.myStruct = Container{
      va: A{a: 1},
      vb: B{b: 2},
      vc: C{c: 3},
    };
  }
}
