contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "hi";
        self.e = emptyCell();
    }
}