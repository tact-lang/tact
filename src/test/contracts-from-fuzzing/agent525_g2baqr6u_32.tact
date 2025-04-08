// test nested optional contract persistent storage
contract Test {
    a: Int? = null;
    b: Int? = null;
    c: Bool? = null;
    s: String? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.s = null;
    }
}
