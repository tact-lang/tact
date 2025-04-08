contract ManyPrimitives {
    i1: Int;
    i2: Int as int16;
    i3: Int as uint32;
    b1: Bool;
    s1: String;
    addr: Address;
    cellData: Cell;
    builderData: Builder;
    sliceData: Slice;
    
    init() {
        self.i1 = 1;
        self.i2 = -2;
        self.i3 = 3;
        self.b1 = true;
        self.s1 = "test";
        self.addr = myAddress();
        self.cellData = emptyCell();
        self.builderData = beginCell();
        self.sliceData = emptyCell().asSlice();
    }
}