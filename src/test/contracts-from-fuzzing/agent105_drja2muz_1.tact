contract TestContract {
    flag: Bool;
    count: Int;
    addressField: Address;
    text: String;

    init() {
        self.flag = true;
        self.count = 42;
        self.addressField = myAddress();
        self.text = "test";
    }

    receive() {}
}