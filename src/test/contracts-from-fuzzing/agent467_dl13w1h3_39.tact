// Test persistent Int field with serialization as uint4 (tiny int)
contract TinyIntStorage {
    small: Int as uint4;

    init() {
        self.small = 3;
    }
}
