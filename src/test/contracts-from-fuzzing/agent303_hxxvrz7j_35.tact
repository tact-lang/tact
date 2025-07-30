struct OuterStruct {
    inner: InnerStruct;
    label: String;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract NestedComplex {
    data: OuterStruct;

    init() {
        self.data = OuterStruct {
            inner: InnerStruct { a: 5, b: true },
            label: "hello"
        };
    }
}