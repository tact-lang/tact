struct A {x: Int; y: Int;}
struct B { a: A; z: Int;}
struct C { b: B; flag: Bool;}

contract NestedWithOption {
  copt: C?;

  init() {
    self.copt = null;
  }
}