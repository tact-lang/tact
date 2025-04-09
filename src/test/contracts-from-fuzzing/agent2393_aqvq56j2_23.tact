// Many optionals with various prims
contract ManyOpts {
    a: Int?; b: Bool?; c: String?; d: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = "abc";
        self.d = null;
    }
}