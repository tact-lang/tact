contract ManyPrimitiveFields {
    i1: Int;
    i2: Int as uint32;
    b: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    str: String;
    escStr: String;

    init() {
        self.i1 = -123;
        self.i2 = 9999;
        self.b = true;
        self.addr = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.str = "hello";
        self.escStr = "escaped \\\" \\n test";
    }

    receive() {}
}