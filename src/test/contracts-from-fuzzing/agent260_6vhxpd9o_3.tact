contract PrimitivesTest {
    intVal: Int = 1;
    boolVal: Bool = true;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String = "hello";
    builderVal: Builder;
    
    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "bye";
        self.builderVal = beginCell();
    }
}