struct OptionalInner {
    foo: Int?;
    bar: Bool?;
}

contract NestedOptionalStruct {
    data: OptionalInner?;

    init() {
        self.data = null;
    }
}