struct OptionalStringBool {
    s: String?;
    b: Bool?;
}

contract OptStrBool {
    f: OptionalStringBool;
    init() {
        self.f = OptionalStringBool{
            s: null,
            b: null
        };
    }
}