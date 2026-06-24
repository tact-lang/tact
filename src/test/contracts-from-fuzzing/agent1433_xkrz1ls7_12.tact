contract TestContract {
    a: Int;
    b: Bool = true;
    c: String = "hi";
    d: Address;
    e: Cell;
    init() {
        self.a = 5;
        self.d = myAddress();
        self.e = emptyCell();
    }
}