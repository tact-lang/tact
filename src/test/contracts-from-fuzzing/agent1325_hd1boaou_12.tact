contract TestContract {
    value1: Int;
    value2: Int?;

    init() {
        self.value1 = 123;
        self.value2 = null;
    }

    receive() {
        if (self.value2 == null) {
            self.value2 = self.value1;
        } else {
            self.value2 = null;
        }
    }
}