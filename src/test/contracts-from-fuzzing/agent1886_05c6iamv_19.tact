contract StorageEdgeCase {
    a: Int as int1; // signed 1-bit, only -1, 0
    b: Int as uint1; // unsigned 1-bit, only 0 or 1
    c: Int as int257; // default
    d: Int as uint256; // biggest unsigned

    init() {
        self.a = 0;
        self.b = 1;
        self.c = -123456789;
        self.d = 987654321;
    }
}