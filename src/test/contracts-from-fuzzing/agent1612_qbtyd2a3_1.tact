contract TestContract {
    foo: Int;
    bar: Bool;
    baz: String;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;

    init() {
        self.foo = 1;
        self.bar = true;
        self.baz = "hello";
        self.addr = myAddress();
        self.cellData = emptyCell();
        self.sliceData = emptyCell().asSlice();
    }

    receive() {
        // Access storage variables to force compilation
        let _ = self.foo + 1;
        let _ = self.bar;
        let _ = self.baz;
        let _ = self.addr;
        let _ = self.cellData;
        let _ = self.sliceData;
    }
}