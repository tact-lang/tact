struct InnerStruct {
    foo: Int;
    bar: Bool;
}

contract OptionalInner {
    data: InnerStruct?;
    init() {
        self.data = null;
    }
}