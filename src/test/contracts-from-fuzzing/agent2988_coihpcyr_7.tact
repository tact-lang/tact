struct A { i: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract ChainNest {
  val: E;
  init() {
    self.val = E{d:D{c:C{b:B{a:A{i:99}}}}};
  }
}