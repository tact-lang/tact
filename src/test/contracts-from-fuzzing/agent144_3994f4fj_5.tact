struct A { x: Int }
struct B { y: A }
struct C { z: B }
contract Chain {
    s: C;
    init() {
        self.s = C{ z: B{ y: A{ x: 123 } } };
    }
}
