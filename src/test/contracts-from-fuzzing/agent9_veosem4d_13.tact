contract DifferentPrimitives {
    i: Int = 1;
    b: Bool = true;
    s: String = "hi";
    a: Address;
    c: Cell;

    init() {
        self.a = myAddress();
        self.c = emptyCell();
    }
}