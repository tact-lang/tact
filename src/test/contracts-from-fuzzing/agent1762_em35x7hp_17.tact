contract InitializeAtInit {
    a: Int = 10;
    b: Int?;
    c: Bool?;
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.b = 5;
        self.c = false;
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
}