struct OptionalDeep {
    inner: Int?;
    nested: Bool?;
    text: String?;
}

contract OptionalDeepFields {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: null,
            nested: null,
            text: null
        };
    }
}