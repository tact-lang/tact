contract PrimitiveMixTest {
    x: Int;
    y: Bool;
    z: String;
    w: Cell;
    s: Slice;
    addr: Address;

    init() {
        self.x = 42;
        self.y = true;
        self.z = "hi";
        self.w = emptyCell();
        self.s = emptyCell().asSlice();
        self.addr = myAddress();
    }
}