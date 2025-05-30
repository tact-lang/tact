struct StructA {
    valA: Int;
}

struct StructB {
    valB: Int;
}

struct StructC {
    a: StructA;
    b: StructB;
}

contract TestContract {
    cdata: StructC = StructC{
        a: StructA{valA: 1},
        b: StructB{valB: 2}
    };

    init() {
        self.cdata = StructC{
            a: StructA{valA: 3},
            b: StructB{valB: 4}
        };
    }

    receive() {
        let _ = self.cdata.b.valB;
    }
}