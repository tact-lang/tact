contract ManyPrimitive {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;

    init() {
        self.a = 42;
        self.b = true;
        self.c = "hello";
        self.d = myAddress();
        self.e = emptyCell();
    }
}