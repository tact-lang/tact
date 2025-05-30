struct A { x: Int; }
struct B { y: A; }
struct C { z: B; }

contract ChainABC {
    chain: C;

    init() {
        self.chain = C{
            z: B{
                y: A{
                    x: 99
                }
            }
        };
    }
}