contract NestedOptionalStructs {
    a: Int?;
    b: Bool?;
    inner: InnerStruct?;

    init() {
        self.a = null;
        self.b = null;
        self.inner = null;
    }
}

struct InnerStruct {
    x: Int;
    y: Bool;
}
