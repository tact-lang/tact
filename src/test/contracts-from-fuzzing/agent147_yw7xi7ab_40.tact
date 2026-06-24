struct Inner1 { a: Int; }
struct Inner2 { a: Int; }
struct Inner3 { a: Int; }
struct Inner4 { a: Int; }
struct Inner5 { a: Int; }

contract ManyInners {
  a: Inner1;
  b: Inner2;
  c: Inner3;
  d: Inner4;
  e: Inner5;

  init() {
    self.a=Inner1{a:1}; self.b=Inner2{a:2}; self.c=Inner3{a:3}; self.d=Inner4{a:4}; self.e=Inner5{a:5};
  }
}