struct StructA {
    x: Int;
}

struct StructB {
    y: StructA;
}

struct StructC {
    z: StructB;
}

contract DeepStructChain {
    chain: StructC;

    init() {
        self.chain = StructC{
            z: StructB{
                y: StructA{
                    x: 123,
                },
            },
        };
    }
}