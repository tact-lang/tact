struct Inner {
    val: Int?;
    text: String;
}

contract OptionalInnerStruct {
    inner: Inner?;

    init() {
        self.inner = Inner{ val: null, text: "foo" };
    }
}