contract TestContract {
    a: Int = 1;
    b: Bool = true;
    f: String = "hello";

    c: Address;
    d: Cell;
    e: Slice;

    init() {
        self.a = 42;
        self.b = false;
        self.f = "world";

        self.c = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }

    receive() {
        let _ = self.a;
    }
}