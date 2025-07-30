struct Child {
    foo: Int;
}

contract OptionalNestedStruct {
    data: Child?;
    init() {
        self.data = null;
    }
}