contract PrimitiveStorage {
    x: Int;
    y: Bool;
    z: Address;
    c: Cell;
    s: Slice;
    st: String;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.st = "string";
    }
}
