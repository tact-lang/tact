struct HasOption {
    inner: Int?;
}

contract OptionalTopLevel {
    store: HasOption?;

    init() {
        self.store = null;
    }
}