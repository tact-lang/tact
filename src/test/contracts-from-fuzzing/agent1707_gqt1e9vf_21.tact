contract DefaultOptionals {
    oInt: Int? = null;
    oBool: Bool? = true;
    oAddress: Address? = null;
    oString: String? = null;

    init() {
        self.oInt = 5; // assign
        self.oBool = false;
        self.oAddress = myAddress();
        self.oString = "world";
    }
}