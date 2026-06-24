contract TestContract {
    value: Int = 0;

    init() {
        self.value = 42;
    }

    receive() {
        self.value = self.value + 1;
    }
}