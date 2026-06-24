struct OptStrBool {
    s: String?;
    b: Bool?;
}

contract OptionalStructs {
    v1: OptStrBool?;
    v2: OptStrBool?;

    init() {
        self.v1 = null;
        self.v2 = null;
    }
}