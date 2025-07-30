// test serialized int constraints
contract TestContract {
    small: Int as uint8;
    big: Int;

    init() {
        self.small = 42;
        self.big = 12345678901234567890;
    }

    receive() {}
}