struct X3 { x: Int; }
struct X2 { x3: X3; }
struct X1 { x2: X2; }

struct Z3 { y: Int; }
struct Z2 { z3: Z3?; }
struct Z1 { z2: Z2?; }

contract MixedDeepShapes {
    nullableChain: Z1?;
    plainChain: X1;

    init() {
        self.nullableChain = null;
        self.plainChain = X1{ x2: X2{ x3: X3{ x: 1 } } };
    }
}