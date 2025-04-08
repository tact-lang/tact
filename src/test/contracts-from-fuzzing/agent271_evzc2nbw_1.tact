contract TestContract {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
    c: Cell;
    b: Builder;
    sl: Slice;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
        self.s = "test";
        self.c = emptyCell();
        self.b = beginCell();
        self.sl = self.c.asSlice();
    }
}
