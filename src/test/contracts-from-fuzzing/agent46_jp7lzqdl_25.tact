struct A { x: Int }

struct B { y: A }

struct C { z: B }

struct D { q: C }

contract DeepChain {
    d: D;

    init() {
        self.d = D{ q: C{ z: B{ y: A{ x: 99 } } } };
    }
}
