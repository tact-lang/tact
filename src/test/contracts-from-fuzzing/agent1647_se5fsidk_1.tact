contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
    }

    receive() {}
}