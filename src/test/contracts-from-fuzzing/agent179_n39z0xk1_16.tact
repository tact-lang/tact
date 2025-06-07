struct Chain1 { x: Int; }
struct Chain2 { c1: Chain1; y: Int; }
struct Chain3 { c2: Chain2; z: Int; }

contract ChainNested {
    c3: Chain3;
    init() {
        self.c3 = Chain3{ c2: Chain2{ c1: Chain1{ x: 7 }, y: 8 }, z: 9 };
    }
}