contract TestManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Int?;
    f: map<Int, Int>;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = null;
        self.f = emptyMap();
    }

    receive() {
        self.a = 10;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = 42;
        self.f.set(1, 2);
    }
}
