struct ComplexStruct {
    a: Int;
    b: Bool;
    c: String;
    d: InnerStruct;
    e: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract TestContract {
    comp: ComplexStruct;

    init() {
        self.comp = ComplexStruct{
            a: 5,
            b: true,
            c: "hello",
            d: InnerStruct{ x: 1, y: false },
            e: null
        };
    }
}
