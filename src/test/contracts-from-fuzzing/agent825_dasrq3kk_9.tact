// Test primitive types persistent fields together
contract Test {
    x: Int;
    y: Bool;
    z: String;
    c: Cell;
    s: Slice;
    b: Builder;
    addr: Address;

    init() {
        self.x = 1;
        self.y = false;
        self.z = "hello";
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.b = beginCell();
        self.addr = myAddress();
    }
}