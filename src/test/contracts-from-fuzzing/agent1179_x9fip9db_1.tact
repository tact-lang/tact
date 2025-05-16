contract TestContract {
    value1: Int;
    value2: Bool;
    value3: Address;

    init() {
        self.value1 = 1;
        self.value2 = true;
        self.value3 = myAddress();
    }

    receive() {}
}