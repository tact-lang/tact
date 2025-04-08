struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
    d: StructA;
}

contract MultiInContract {
    x: StructC;

    init() {
        self.x = StructC{
            c: StructB{
                b: StructA{ a: 5 }
            },
            d: StructA{ a: 10 }
        };
    }
}