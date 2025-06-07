contract Test1 {
    value: Int;
    flag: Bool;
    text: String;
    address: Address;

    init() {
        self.value = 0;
        self.flag = false;
        self.text = "";
        self.address = myAddress();
    }
}