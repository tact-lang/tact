struct OptStringWrap {
    s: String?;
}

contract NullableStringPersist {
    state: OptStringWrap;

    init() {
        self.state = OptStringWrap{
            s: null,
        };
    }
}