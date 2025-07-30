struct BWrap {
    b: Builder?;
}

contract OptionalBuilderSet {
    inner: BWrap;

    init() {
        self.inner = BWrap{ b: beginCell() };
    }
}
