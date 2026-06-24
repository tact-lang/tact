struct HasStrOpt {
    inner: String?;
}

contract OptionalStringStruct {
    s: HasStrOpt;

    init() {
        self.s = HasStrOpt{
            inner: null
        };
    }
}