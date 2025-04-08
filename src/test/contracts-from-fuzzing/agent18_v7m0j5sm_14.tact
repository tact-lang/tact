struct A {x:Int; y:Int;}
struct B {m:A; n:A;}
struct C {p:B; q:B;}
struct D {r:C; s:C;}

contract TreeShape {
  root: D;

  init() {
    self.root = D{
      r: C{ p:B{m:A{x:1,y:2}, n:A{x:3,y:4}}, q:B{m:A{x:5,y:6}, n:A{x:7,y:8}} },
      s: C{ p:B{m:A{x:9,y:10},n:A{x:11,y:12}}, q:B{m:A{x:13,y:14}, n:A{x:15,y:16}} }
    };
  }
}