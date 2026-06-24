contract TestContract {
    largeNumber: Int = 1234567890123456789012345678901234567890;

    init() {
        self.largeNumber = 9876543210987654321098765432109876543210;
    }

    receive() {
        self.largeNumber = self.largeNumber + 1;
    }
}