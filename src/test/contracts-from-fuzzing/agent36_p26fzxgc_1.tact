contract TestContract {
    simpleInt: Int;
    simpleBool: Bool;
    simpleString: String;
    simpleAddress: Address;

    init() {
        self.simpleInt = 1;
        self.simpleBool = true;
        self.simpleString = "hello";
        self.simpleAddress = myAddress();
    }

    receive() {
        dump(self.simpleInt);
        dump(self.simpleBool);
        dump(self.simpleString);
        dump(self.simpleAddress);
    }
}