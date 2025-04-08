contract TestContract {
    foo: Int as uint8;
    bar: Int as int16;
    val: Int as coins;

    init() {
        self.foo = -1;  // overflow
        self.bar = 40000; // overflow
        self.val = -1;    // invalid coins
    }

    receive() {}
}