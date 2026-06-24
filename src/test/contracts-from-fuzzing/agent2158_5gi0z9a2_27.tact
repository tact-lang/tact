contract RemainingOnContractField {
    myData: Slice as remaining;

    init() {
        self.myData = emptyCell().asSlice();
    }
}