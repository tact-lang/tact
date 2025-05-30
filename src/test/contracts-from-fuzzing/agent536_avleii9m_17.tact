struct Inner {
    value: Int;
}

contract OptionalStructVar {
    field: Inner? = null;

    init() {
        self.field = Inner{value: 42};
    }
}