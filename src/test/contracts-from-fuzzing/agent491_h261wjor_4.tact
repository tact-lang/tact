struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }
struct D { w: C; }
struct E { v: D; }
struct F { u: E; }
struct G { t: F; }

contract ManyLayers {
    deep: G;
    init() {
        self.deep = G{ t: F{ u: E{ v: D{ w: C{ z: B{ y: A{ x: 9 } } } } } } };
    }
}