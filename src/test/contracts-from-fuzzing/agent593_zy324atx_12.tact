// Top-level optional persistent variables
contract OptionalFields {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    init() {
        self.a = 5;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
    }
}