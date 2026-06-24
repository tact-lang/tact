struct Nested {
    inner: InnerStruct;
    optionalInner: InnerStruct?;
}

struct InnerStruct {
    val1: Int;
    flag: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{
            inner: InnerStruct{val1: 1, flag: true},
            optionalInner: null
        };
    }
}