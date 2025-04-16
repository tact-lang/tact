contract TestContract {
    foo: Int as uint8 = 1;
    bar: Int as int16 = -123;
    val: Int as coins = ton("0.1");

    init() {
        self.foo = 255; // in range for uint8
        self.bar = -32768; // in range for int16
        self.val = ton("0.5");
    }

    receive() {}
}