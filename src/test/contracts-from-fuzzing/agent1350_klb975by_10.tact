struct Inner {
    x: Int;
}

contract OptionalStructFieldNullDefault {
    data: Inner?;

    init() {
        self.data = null;
    }
}