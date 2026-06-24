contract TestContract {
    x: Int;
    y: Bool;
    z: Address;
    s: String;
    c: Cell;
    sl: Slice;

    init() {
        self.x = 1;
        self.y = true;
        self.z = myAddress();
        self.s = "hi";
        self.c = emptyCell();
        self.sl = emptyCell().asSlice();
    }
}