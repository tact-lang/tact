// different serialization formats
contract Test {
    small: Int as uint4;
    large: Int as int64;

    init() {
        self.small = 5;
        self.large = -100;
    }
}