struct Holder {
    content: Int;
}

contract OptionalNestedStruct {
    val: Holder?;

    init() {
        self.val = null;
    }
}