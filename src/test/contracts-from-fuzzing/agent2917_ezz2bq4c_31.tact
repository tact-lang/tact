contract MixedPrimitives {
    x: Int;
    y: Bool;
    z: Address;
    w: Slice;
    q: Cell;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
        self.w = emptyCell().asSlice();
        self.q = emptyCell();
    }
}
