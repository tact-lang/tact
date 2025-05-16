// A contract with many persistent fields of different primitive types
contract TestContract {
    intval: Int = 42;
    boolval: Bool = false;
    addr: Address;
    str: String;
    cellval: Cell;
    sliceval: Slice;
    builderval: Builder;

    init() {
        self.addr = myAddress();
        self.str = "test";
        self.cellval = emptyCell();
        self.sliceval = emptyCell().asSlice();
        self.builderval = beginCell();
    }
}