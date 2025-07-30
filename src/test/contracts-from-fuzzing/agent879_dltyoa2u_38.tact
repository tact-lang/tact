struct InnerStruct {
    a: Int;
}

contract OptionalNestedInner {
    data: InnerStruct?;

    init() {
        self.data = null;
    }
}
