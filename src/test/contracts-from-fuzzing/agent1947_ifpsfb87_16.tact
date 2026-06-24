struct Inner {
    f: Int;
}

contract OptionalTop {
    wrapped: Inner?;
    init() {
        self.wrapped = null;
    }
}