contract TestContract {
    valInt: Int;
    valBool: Bool;
    valAddress: Address;
    valString: String;

    init() {
        self.valInt = 5;
        self.valBool = true;
        self.valAddress = myAddress();
        self.valString = "hello";
    }
}