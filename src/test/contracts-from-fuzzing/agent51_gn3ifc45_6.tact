contract ManyPrimitives {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    c: Cell;
    s: Slice;
    init() {
        self.x = 10;
        self.y = true;
        self.z = "hi";
        self.addr = myAddress();
        self.c = emptyCell();
        self.s = self.c.asSlice();
    }
}
