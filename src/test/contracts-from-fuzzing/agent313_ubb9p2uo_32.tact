struct OptionalStrBool {
    s: String?;
    b: Bool?;
}

contract OptStructs {
    asdf: OptionalStrBool;

    init() {
        self.asdf = OptionalStrBool{
            s: null,
            b: null
        };
    }
}