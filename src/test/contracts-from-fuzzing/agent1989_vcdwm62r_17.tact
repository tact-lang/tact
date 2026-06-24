struct SOptString {
    maybe: String?;
}

contract OptStringPersist {
    s: SOptString;

    init() {
        self.s = SOptString{
            maybe: null,
        };
    }
}