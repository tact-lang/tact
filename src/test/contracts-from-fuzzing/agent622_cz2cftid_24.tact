struct A { f: Int = 1; }
struct B { x: A; }
struct C { y: B; }

contract Chain4 {
  val: C = C{ y: B{ x: A{} } };
  init() {}
}