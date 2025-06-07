contract TestContract {
    zero: Int as uint4; // range 0..15

    init() {
        self.zero = -1; // invalid, but caught only after compute phase
        self.zero = 500; // invalid
        self.zero = 10; // in range
    }

    receive() {
        self.zero = 20; // invalid, but caught after compute
        self.zero = 0;  // valid
    }
}