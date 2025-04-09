struct NestedStruct {
    val: Int;
}

contract OptionalNestedInPersistent {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}