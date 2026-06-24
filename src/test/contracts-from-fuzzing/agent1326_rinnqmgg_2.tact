contract TestContract {
    val1: Int = 0;
    val2: Int = 1;
    val3: Bool = false;
    val4: Cell;
    val5: Address;

    init() {
        self.val1 = 42;
        self.val2 = 100;
        self.val3 = true;
        self.val4 = emptyCell();
        self.val5 = myAddress();
    }

    receive() {
        let _ = self.val1 + self.val2;
        let _ = self.val3;
        let _ = self.val4;
        let _ = self.val5;
    }
}