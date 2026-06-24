struct StructA {
    a: Int;
    b: Bool;
}

struct StructB {
    c: String;
    d: StructA;
}

struct StructC {
    e: Int?;
    f: StructB;
    g: Bool;
}

contract StructChain {
    data: StructC;

    init() {
        self.data = StructC{
            e: null,
            f: StructB{
                c: "hi",
                d: StructA{
                    a: 5,
                    b: true
                }
            },
            g: false
        };
    }
}