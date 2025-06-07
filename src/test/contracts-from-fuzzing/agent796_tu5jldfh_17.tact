// Test many fields of mixed primitive types in contract storage
contract TestContract {
    x: Int;
    y: Bool;
    s: String;
    addr: Address;
    c: Cell;
    b: Builder;
    sl: Slice;

    init() {
        self.x = 1;
        self.y = true;
        self.s = "hello";
        self.addr = myAddress();
        self.c = emptyCell();
        self.b = beginCell();
        self.sl = emptyCell().asSlice();
    }
}