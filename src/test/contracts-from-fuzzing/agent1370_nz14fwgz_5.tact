struct Inner {
    a: Int;
    b: Int?;
}

contract OptionalInnerField {
    data: Inner?;

    init() {
        self.data = null;
    }
}