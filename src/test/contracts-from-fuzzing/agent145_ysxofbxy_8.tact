struct Inner {
    innerField: Int;
}

contract OptionalStructFieldNull {
    data: Inner?;
    num: Int;

    init() {
        self.data = null;
        self.num = 44;
    }
}