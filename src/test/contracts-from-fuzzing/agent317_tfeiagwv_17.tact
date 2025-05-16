contract MixedTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "test";
        self.d = emptyCell();
        self.e = myAddress();
    }
}