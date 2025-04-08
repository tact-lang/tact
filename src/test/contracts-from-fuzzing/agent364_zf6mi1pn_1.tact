contract TestContract {
    data1: Int;
    data2: Bool;
    data3: String;
    data4: Cell;
    data5: Address;
    data6: Slice;
    data7: Int?;
    
    init() {
        self.data1 = 1;
        self.data2 = false;
        self.data3 = "test";
        self.data4 = emptyCell();
        self.data5 = myAddress();
        self.data6 = emptyCell().asSlice();
        self.data7 = null;
    }
}