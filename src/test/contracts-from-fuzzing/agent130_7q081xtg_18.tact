// Testing multiple string and address fields with various defaults
contract TestContract {
    s1: String = "";
    s2: String?;
    s3: Address;
    s4: Address;
    s5: String = "hi";
    s6: String?;

    init() {
        self.s2 = null;
        self.s6 = null;
        self.s3 = myAddress();
        self.s4 = myAddress();
    }

    receive() {
        self.s1 = self.s5;
    }
}