contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Cell;
    d: Address;
    e: String = "test";

    init() {
        self.a = 42;
        self.b = false;
        self.c = emptyCell();
        self.d = myAddress();
        self.e = "changed";
    }
}