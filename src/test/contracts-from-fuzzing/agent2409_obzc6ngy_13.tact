struct Inner {
    s: String;
}

contract OptionalStructNullable {
    param: Inner?;

    init() {
        self.param = null;
    }
}