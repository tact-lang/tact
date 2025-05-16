contract TestContract {
    a: Int as uint8;

    init() {
        self.a = -1;  // temporarily invalid for uint8
        self.a = 255; // valid
    }

    receive() {
        dump(self.a);
    }
}