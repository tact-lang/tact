struct ComplexNested {
    a: Int;
    b: Bool;
    inner: InnerComplex;
}

struct InnerComplex {
    c: String;
    d: Bool?;
    e: String;
}

contract WithComplex {
    field: ComplexNested;

    init() {
        self.field = ComplexNested{
            a: 1,
            b: true,
            inner: InnerComplex{c:"hello", d:false, e:"bye"}
        };
    }
}