struct InlineDefaults {
    a: Int = 0;
    b: Bool = true;
    c: Int?;
}

contract InlineDefaultsStorage {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{
            c: null,
        };
    }
}