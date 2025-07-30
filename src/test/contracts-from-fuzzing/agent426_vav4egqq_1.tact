contract TestContract {
    value1: Int = 0;
    value2: Bool = true;
    value3: Address;
    init() {
        self.value1 = 10;
        self.value2 = false;
        self.value3 = myAddress();
    }
}