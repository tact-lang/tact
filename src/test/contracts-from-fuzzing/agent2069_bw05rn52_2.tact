struct Nested {
    inner: InnerStruct;
    optInner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Nested;
    optField: Nested?;

    init() {
        self.field1 = Nested{
            inner: InnerStruct{a: 1, b: true},
            optInner: null,
        };
        self.optField = null;
    }
}