contract TestContract {
    val1: Int = 1;
    val2: Bool = true;
    val3: Address;
    val4: Cell; // removed default due to const eval
    val5: Slice;
    val6: String = "hello";

    init() {
        self.val1 = 123;
        self.val2 = false;
        self.val3 = myAddress();
        self.val4 = emptyCell();
        self.val5 = emptyCell().asSlice();
        self.val6 = "world";
    }
}