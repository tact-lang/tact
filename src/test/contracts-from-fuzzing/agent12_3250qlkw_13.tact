struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
}

contract ChainNested {
    chain: StructC;

    init() {
        self.chain = StructC { c: StructB { b: StructA { a: 42 } } };
    }
}