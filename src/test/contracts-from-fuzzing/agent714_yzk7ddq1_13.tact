struct StructA {
    i: Int;
}

struct StructB {
    a: StructA;
}

struct StructC {
    b: StructB;
}

contract DeepChain {
    chain: StructC;

    init() {
        self.chain = StructC{
            b: StructB{
                a: StructA{ i: 10 }
            }
        };
    }
}