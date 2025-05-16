contract OptionalDefaultsTest {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
    f: Slice? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }

    receive() {
        let _ = self.a != null ? self.a!! : 0;
    }
}