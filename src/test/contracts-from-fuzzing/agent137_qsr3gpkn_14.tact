struct A { i: Int }
struct B { a: A }
struct C { b: B }

contract ManyLayers {
    layer: C;

    init() {
        self.layer = C{b: B{a: A{i: 999}}};
    }

    receive() {}
}