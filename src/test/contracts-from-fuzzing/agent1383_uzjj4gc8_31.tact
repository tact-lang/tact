struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract DeepChain {
    c: C;
    init() {
        self.c = C{
            z: B{ y: A{ x: 5 } }
        };
    }
}