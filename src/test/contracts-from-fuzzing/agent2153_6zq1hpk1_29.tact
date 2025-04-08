struct Inner {
    x: Int;
}

contract NullableInnerStruct {
    payload: Inner?;

    init() {
        self.payload = null;
    }
}
