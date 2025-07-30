contract TestContract {
    a: Int = 1;

    init() {
        self.a = 42;
    }

    receive() {
        self.a = -1; // invalid for unsigned serialization
        self.a = 0;  // back to valid
    }
}