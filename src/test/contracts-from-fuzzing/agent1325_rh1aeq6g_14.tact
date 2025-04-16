contract MultiInit {
    x: Int;
    y: Bool;
    z: String;
    c: Cell;
    s: Slice;
    b: Builder;
    a: Address;

    init() {
        self.x = 42;
        self.y = false;
        self.z = "bar";
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.b = beginCell();
        self.a = myAddress();
    }
}