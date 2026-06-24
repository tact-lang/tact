struct Inner {
    enabled: Bool;
}

contract OptionalStructField {
    obj: Inner?;

    init() {
        self.obj = null;
    }
}