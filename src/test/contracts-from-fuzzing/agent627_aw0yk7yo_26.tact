// deeply nested with optionals
struct A { x:Int?; b:B; }
struct B { y:Int; c:C; }
struct C { z:Int?; d:D; }
struct D { q:Int; }

contract Test {
    field:A;
    init() {
      self.field = A{ x:null, b: B{ y:1, c: C{ z:null, d: D{q:2} } } };
    }
}