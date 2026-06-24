struct InnerStruct {
    a: Int;
    b: String;
}

contract NestedAsTop {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct { a: 11, b: "foo" };
    }
}
