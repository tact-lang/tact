contract ManyTypes {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }

    receive() {
        let _ = self.a + 1;
    }
}