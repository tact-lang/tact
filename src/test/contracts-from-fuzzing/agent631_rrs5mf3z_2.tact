struct InnerStruct {
    a: Int;
    b: String;
    optional: Bool?;
}

contract Test {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            a: 1,
            b: "test",
            optional: null,
        };
    }
}
