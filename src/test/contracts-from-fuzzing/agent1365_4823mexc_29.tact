struct StructA {
    foo: Int;
    bar: Bool;
}

struct StructB {
    baz: StructA;
    qux: Bool;
}

contract StructInsideStruct {
    s: StructB;

    init() {
        self.s = StructB{
            baz: StructA{
                foo: 17,
                bar: true,
            },
            qux: false,
        };
    }
}