struct A { x: Int; }
struct B { y: Int; }
struct C { a: A; b: B; }
struct D { c: C; z: Int; }

contract DeepCompose {
  val: D;

  init() {
    self.val = D{
      c:C{
        a:A{x:1},
        b:B{y:2}
      },
      z:3
    };
  }
}
