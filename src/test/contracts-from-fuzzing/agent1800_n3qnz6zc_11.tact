contract MaxSmallTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "text";
        self.d = emptyCell();
        self.e = myAddress();
    }
}