struct InnerOptStruct {
    x: Int?;
    y: Bool?;
}

struct LongStruct {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: InnerOptStruct;
    f: Address?;
    g: Int;
}

contract ComplexFieldPersist {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a: 1,
            b: true,
            c: null,
            d: false,
            e: InnerOptStruct{ x: null, y: true },
            f: null,
            g: 999
        };
    }
}