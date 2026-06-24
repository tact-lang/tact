contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Cell;
    f: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = "string";
        self.e = emptyCell();
        self.f = myAddress();
    }
}