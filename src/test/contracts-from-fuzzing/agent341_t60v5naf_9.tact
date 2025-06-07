struct InnerStruct {
    flag: Bool;
    message: String;
}

contract OptionalInner {
    inner: InnerStruct?;

    init() {
        self.inner = InnerStruct{ flag: true, message: "hi" };
    }
}