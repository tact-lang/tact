contract DefaultsTest {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Address; // no default, must init
    e: Slice;
    f: Cell;

    init() {
        self.d = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.e = emptyCell().asSlice();
        self.f = emptyCell();
    }
}