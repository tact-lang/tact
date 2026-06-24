struct StructA {
    a: Int;
    b: Int;
}

struct StructB {
    b: StructA;
    c: Int;
}

struct StructC {
    c: StructB;
    d: Int;
}

contract DeepCombine {
    f: StructC;

    init() {
        self.f = StructC{
            c: StructB{
                b: StructA{ a:1, b:2 },
                c: 3
            },
            d: 4
        };
    }
}