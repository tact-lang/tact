contract TestContract {
    dataInt: Int = 1;
    dataBool: Bool = false;
    dataOptional: Int? = null;
    dataString: String = "hi";
    dataAddress: Address;

    init() {
        self.dataInt = 2;
        self.dataBool = true;
        self.dataOptional = 5;
        self.dataString = "hello";
        self.dataAddress = myAddress();
    }
}