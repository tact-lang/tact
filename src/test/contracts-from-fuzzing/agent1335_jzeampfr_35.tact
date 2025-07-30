struct Wrap {
    inner: Int;
}

contract OptionalWrap {
    field: Wrap?;

    init() {
        self.field = null;
    }
}