contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = myAddress();
        self.e = emptyCell();
    }

    receive() {}
}