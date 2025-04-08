contract MultipleFields {
    x: Int;
    y: Bool;
    z: String;
    c: Cell;
    s: Slice;
    addr: Address;

    init() {
        self.x = 10;
        self.y = true;
        self.z = "testing";
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.addr = myAddress();
    }
}