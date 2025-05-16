contract FieldOrdering {
    flag: Bool;
    text: String;
    addr: Address;
    someInt: Int;

    init() {
        self.flag = true;
        self.text = "order";
        self.addr = myAddress();
        self.someInt = 555;
    }
}
