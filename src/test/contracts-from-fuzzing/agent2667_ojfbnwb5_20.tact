struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
}

struct StructD {
    d: StructC;
}

struct StructE {
    e: StructD;
}

contract DeepChain {
    val: StructE;
    init() {
        self.val = StructE{e: StructD{d: StructC{c: StructB{b: StructA{a: 123}}}}};
    }
    receive() {
        self.val = StructE{e: StructD{d: StructC{c: StructB{b: StructA{a: 321}}}}};
    }
}