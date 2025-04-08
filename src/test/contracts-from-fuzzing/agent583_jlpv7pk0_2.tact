contract TestStorage {
    val1: Int = 5;
    val2: Bool = false;
    val3: Address;  
    val4: Cell;     
    val5: Slice;    
    val6: String = "hello";

    init() {
        self.val3 = myAddress();
        self.val4 = emptyCell();
        self.val5 = emptyCell().asSlice();
    }
}