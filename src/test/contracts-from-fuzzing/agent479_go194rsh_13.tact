struct Data {
    s: String;
    b: Bool;
}

contract OptionalInStructOptional {
    inner: Data?;

    init() {
        self.inner = null;
    }
}