contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: Address;
    val4: Cell;
    val5: Slice;
    val6: String = "testing";

    init() {
        self.val3 = myAddress();
        self.val4 = emptyCell();
        self.val5 = emptyCell().asSlice();
    }
}