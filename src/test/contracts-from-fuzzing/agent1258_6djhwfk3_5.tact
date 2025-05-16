contract ManyPersistentFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Bool;
    h: Int;
    i: String;
    j: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = false;
        self.h = 2;
        self.i = "bye";
        self.j = myAddress();
    }

    receive() {
        self.a += 1;
    }
}