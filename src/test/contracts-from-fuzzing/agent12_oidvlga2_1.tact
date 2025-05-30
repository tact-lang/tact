contract Test1 {
    oneByte: Int as uint8;

    init() {
        self.oneByte = 200; // valid: within 0-255
    }

    // Empty receiver for deployment
    receive() {
        let tmp = self.oneByte + 10; // computed value 210, valid
        self.oneByte = tmp;
    }
}
