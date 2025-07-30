contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "Hello";
        self.d = emptyCell();
        self.e = myAddress();
    }
}