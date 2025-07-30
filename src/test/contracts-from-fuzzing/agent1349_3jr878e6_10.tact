contract OptionalPrimitive {
    optInt: Int? = null;
    optBool: Bool? = true;
    optAddr: Address? = null;
    optCell: Cell? = null;

    receive() {
        self.optInt = 5;
        self.optBool = false;
        self.optAddr = null;
        self.optCell = null;
    }
}