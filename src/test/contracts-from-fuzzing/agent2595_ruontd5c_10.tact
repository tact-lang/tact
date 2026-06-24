contract ManyPrimitives {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    c: Cell;
    s: Slice;
    b: Builder;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "hello";
        self.addr = myAddress();
        self.c = emptyCell();
        self.s = self.c.asSlice();
        self.b = beginCell();
    }
}