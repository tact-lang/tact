contract StorageOrdering {
    a: Int as uint8;
    b: Int;
    c: Int as uint256;
    d: Int as int128;
    e: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}