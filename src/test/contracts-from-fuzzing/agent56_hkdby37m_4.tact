contract ManyTypes {
    x: Int;
    y: Int?;
    z: Bool;
    addr: Address;
    c: Cell;
    sl: Slice;
    s: String;

    init() {
        self.x = 1;
        self.y = null;
        self.z = true;
        self.addr = myAddress();
        self.c = emptyCell();
        self.sl = self.c.asSlice();
        self.s = "test";
    }
}