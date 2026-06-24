// Persistent optional primitive fields with defaults
contract Test {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = false;

    init() {
        self.a = 10;
        self.c = null;
    }
}