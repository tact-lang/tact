contract ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;

    init() {
        self.i = 12;
        self.b = true;
        self.s = "abc";
        self.a = myAddress();
        self.c = emptyCell();
    }
}