contract ComputedInts {
    c: Int = crc32("hello");
    init() {
        self.c = 42;
    }
}