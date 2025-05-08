contract PersistentManyTypes {
    i: Int;
    b: Bool;
    a: Address;
    s: String;
    c: Cell;

    init() {
        self.i = 1;
        self.b = true;
        self.a = myAddress();
        self.s = "str";
        self.c = emptyCell();
    }
}