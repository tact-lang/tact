struct OptionalWrap {
    inner: Int?;
    flag: Bool?;
}

contract OptContract {
    state: OptionalWrap;

    init() {
        self.state = OptionalWrap{
            inner: null,
            flag: null,
        };
    }
}
