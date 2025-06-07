struct InnerStr {
    s: String;
    i: Int;
}

contract NullableStruct {
    inner: InnerStr?;

    init() {
        self.inner = InnerStr{ s: "hi", i: 42 };
    }
}
