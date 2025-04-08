struct ComplexNestedStruct {
    foo: InnerA;
    bar: InnerB;
}

struct InnerA {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

struct InnerB {
    x: Int;
    y: Bool;
    z: Int?;
}

contract TestComplex {
    data: ComplexNestedStruct;

    init() {
        self.data = ComplexNestedStruct{
            foo: InnerA{
                a: 1,
                b: true,
                c: null,
                d: false
            },
            bar: InnerB{
                x: 42,
                y: true,
                z: null
            }
        };
    }
}
