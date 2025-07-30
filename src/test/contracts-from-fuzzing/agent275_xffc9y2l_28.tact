// Optional contract storage variables with default null
contract OptionalTopLevel {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}