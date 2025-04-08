// very large nested struct chain
struct A { x: Int }
struct B { y: A }
struct C { z: B }
struct D { w: C }
struct E { v: D }
struct F { u: E }
struct G { t: F }
struct H { s: G }
struct I { r: H }
struct J { q: I }

contract MegaDepth {
    val: J;
    init() {
        self.val = J{q:I{r:H{s:G{t:F{u:E{v:D{w:C{z:B{y:A{x:9}}}}}}}}}};
    }
}