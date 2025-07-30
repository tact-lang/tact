// Test serialization int as uint4
contract SerializeSmallInt {
    small: Int as uint4;

    init() {
        self.small = 2;
    }

    receive() {
        self.small += 1;
    }
}