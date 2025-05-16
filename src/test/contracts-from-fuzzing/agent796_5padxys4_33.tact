contract NestedStructs {
    inner: InnerStruct;
    init() {
        self.inner = InnerStruct{ a: 1, b: 2, c: null };
    }
}

struct InnerStruct {
    a: Int;
    b: Int;
    c: Int?;
}