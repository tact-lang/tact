struct A { x: Int }
struct B { x: Int }
struct C { x: Int }
struct D { x: Int }

contract InitAll {
  a: A; b: B; c: C; d: D;

  init(){
    self.a=A{x:1};
    self.b=B{x:2};
    self.c=C{x:3};
    self.d=D{x:4};
  }
}