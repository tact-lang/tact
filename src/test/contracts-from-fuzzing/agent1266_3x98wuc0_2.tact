contract OptionalStructField {
    nested: InnerStruct? = null;
    init() {
        self.nested = null;
    }
}

struct InnerStruct {
    foo: Int;
    bar: Bool;
    baz: String?;
}