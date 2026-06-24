contract CompositePrimitives {
    intVal: Int;
    boolVal: Bool;
    addr: Address;
    str: String;
    cell: Cell;
    slice: Slice;
    
    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.addr = myAddress();
        self.str = "test";
        self.cell = emptyCell();
        self.slice = self.cell.asSlice();
    }
}