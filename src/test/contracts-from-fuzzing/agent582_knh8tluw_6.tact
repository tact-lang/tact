struct HasOptionalString {
    str: String?;
    count: Int;
}

contract OptStringPersist {
    data: HasOptionalString;

    init() {
        self.data = HasOptionalString{
            str: null,
            count: 123
        };
    }
}
