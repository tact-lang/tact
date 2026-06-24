struct OptionalStringBool {
    s: String?;
    b: Bool?;
}

contract OptStrBool {
    data: OptionalStringBool;
    init() {
        self.data = OptionalStringBool{
            s: null,
            b: null
        };
    }
}