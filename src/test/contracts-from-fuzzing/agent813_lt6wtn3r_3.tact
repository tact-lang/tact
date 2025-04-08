contract TestContract {
    optInt: Int? = null;
    optBool: Bool? = null;
    optAddr: Address? = null;
    optCell: Cell? = null;

    init() {
        self.optInt = 5;
        self.optBool = true;
        self.optAddr = myAddress();
        self.optCell = emptyCell();
    }
}