struct OptionalWrap {
    x: Int?;
}

contract OptionalWrapInner {
    field: OptionalWrap?;

    init() {
        self.field = OptionalWrap{
            x: null
        };
    }
}