struct StructA {
    val: Int;
}

struct StructB {
    sub: StructA;
}

struct StructC {
    sub: StructB;
}

contract TripleChain {
    data: StructC;
    init() {
        self.data = StructC{
            sub: StructB{
                sub: StructA{
                    val: 123
                }
            }
        };
    }
}