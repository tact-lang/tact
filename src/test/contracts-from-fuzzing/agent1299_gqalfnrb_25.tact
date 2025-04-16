contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;

    init() {
        self.i = 1;
        self.b = false;
        self.s = "test";
        self.c = emptyCell();
        self.a = myAddress();
    }
}