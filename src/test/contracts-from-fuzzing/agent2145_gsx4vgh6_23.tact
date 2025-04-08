contract StorageTest {
    a: Int as int4 = 1;
    b: Int as uint8 = 255;
    c: Int as int64 = -1;

    init() {
        self.a = 7;
        self.b = 128;
        self.c = 0;
    }
}