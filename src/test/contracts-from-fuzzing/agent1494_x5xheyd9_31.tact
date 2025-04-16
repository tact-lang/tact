struct Inner {
    value: Int;
}

contract OptionalInnerStruct {
    val: Inner?;

    init() {
        self.val = null;
    }
}
