struct A { x: Int }
struct B { y: A }
struct C { z: B }
struct D { w: C }
struct E { q: D }
struct F { r: E }

contract Test {
    deep: F;
    init() { self.deep = F{r:E{q:D{w:C{z:B{y:A{x:10}}}}}}; }
}