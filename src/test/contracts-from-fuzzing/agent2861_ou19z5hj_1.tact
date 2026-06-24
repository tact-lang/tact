contract TestContract {
    number: Int;
    flag: Bool;
    addressField: Address;
    text: String;

    init() {
        self.number = 1;
        self.flag = true;
        self.addressField = myAddress();
        self.text = "hello";
    }
}