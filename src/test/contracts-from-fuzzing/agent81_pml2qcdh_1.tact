contract Test {
    value1: Int;
    value2: Bool;
    value3: String;
    value4: Address;

    init() {
        self.value1 = 0;
        self.value2 = true;
        self.value3 = "test";
        self.value4 = myAddress();
    }
}
