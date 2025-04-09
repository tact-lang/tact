struct InnerOpt {
    m: map<Int, Int>;
    n: Int?;
}

contract OptionalMapFieldsOK {
    inner: InnerOpt;

    init() {
        self.inner = InnerOpt{m: emptyMap(), n: null};
    }
}