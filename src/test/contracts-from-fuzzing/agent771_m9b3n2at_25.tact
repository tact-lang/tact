struct InnerA { a: Int; }
struct InnerB { b: Int; }

struct OuterS {
    innerA: InnerA;
    innerB: InnerB;
}

contract NestedMultipleStructs {
    os: OuterS;
    init() {
        self.os = OuterS{
            innerA: InnerA{a:1},
            innerB: InnerB{b:2},
        };
    }
}