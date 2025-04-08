contract NestedStructFields {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            f1: true,
            f2: 123,
            f3: "abc",
            f4: null
        };
    }
}

struct InnerStruct {
    f1: Bool;
    f2: Int;
    f3: String;
    f4: String?;
}