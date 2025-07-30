contract Test {
    intVal: Int;
    flag: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;

    init() {
        self.intVal = 12345;
        self.flag = true;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "Hello";
    }
}

contract Caller {
    receive() {
        // reference so Test is compiled
    }
}
