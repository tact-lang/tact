contract StorageOrdering {
    a: Int as uint8;
    b: Int as uint256;
    c: Int as int8;
    d: Int as int257;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = -1;
        self.d = -2;
    }
}