struct EmptyOptionalWrap {
    inner: Int?;
}

contract OptionalNoInit {
    field: EmptyOptionalWrap;

    init() {
        self.field = EmptyOptionalWrap{};
    }
}
