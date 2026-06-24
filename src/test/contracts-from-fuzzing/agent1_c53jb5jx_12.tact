// Test having multiple receive functions for different string literals
contract MultiStringReceiver {
    receivedA: Bool;
    receivedB: Bool;

    init() {
        self.receivedA = false;
        self.receivedB = false;
    }

    receive("A") {
        self.receivedA = true;
    }

    receive("B") {
        self.receivedB = true;
    }
}
