struct A { a: Int; }
struct B { b: A; }
struct C { c: B; }

contract ManyLayers {
    layer: C;
    init() {
        self.layer = C{ c: B{ b: A{ a: 1 } } };
    }
}