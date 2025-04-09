struct ComplexTuple {
    flag: Bool;
    str: String;
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TupleNested {
    tup: ComplexTuple;

    init() {
        self.tup = ComplexTuple{
            flag: true,
            str: "hi",
            inner: InnerStruct{ a: 7, b: false }
        };
    }
}