struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    s: StructA;
}

struct StructC {
    s: StructB;
}

contract DeepChain {
    f: StructC;

    init() {
        self.f = StructC{
            s: StructB{
                s: StructA{
                    a: 11,
                    b: true,
                },
            },
        };
    }
}
