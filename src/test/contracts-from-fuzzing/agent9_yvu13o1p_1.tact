contract TestContract {
    value1: Int;
    value2: Int?;
    value3: Int as uint32;

    init() {
        self.value1 = 5;
        self.value2 = null;
        self.value3 = 10;
    }

    receive() {
        self.value1 = 6;
        self.value2 = 7;
        self.value3 = 11;
    }
}