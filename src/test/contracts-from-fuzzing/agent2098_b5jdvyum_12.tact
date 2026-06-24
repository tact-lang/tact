contract ManyPrimitives {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Address;
    e: Cell;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
    }
}
