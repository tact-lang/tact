struct A { x: Int; y: Bool }
struct B { z: A }
struct C { w: B }

contract Test {
    nested: C;
    init() {
        self.nested = C{ w: B{ z: A{ x: 42, y: true } } };
    }
}