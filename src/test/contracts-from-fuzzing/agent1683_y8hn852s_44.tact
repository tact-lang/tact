contract EdgeSerialization {
    foo: Int as int1;   // smallest possible signed int (1 bit)
    bar: Int as uint256; // largest possible unsigned int (256 bits)

    init() {
        self.foo = 1;
        self.bar = 1 << 255; // big number within 256 bits
    }

    receive() {
        self.foo = 0;
    }
}