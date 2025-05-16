contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Cell;
    field4: Slice;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = emptyCell();
        self.field4 = emptyCell().asSlice();
    }
}