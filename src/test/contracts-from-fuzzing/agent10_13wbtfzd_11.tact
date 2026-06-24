struct Inner {
    flag: Bool;
}

contract OptionalStructOptionalField {
    data: Inner?;

    init() {
        self.data = null;
    }
}