contract ManyFields {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Cell;
    e: Slice;
    f: String = "A";
    g: Int = 7;
    h: Bool = true;
    i: Int = 9;
    j: Bool = false;
    k: String = "B";
    l: Int = 11;
    m: Bool = true;
    n: Int = 13;
    o: Bool = false;
    p: String = "C";
    q: Int = 17;

    init() {
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
    }
}