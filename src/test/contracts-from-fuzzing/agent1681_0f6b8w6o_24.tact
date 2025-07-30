// Test optional int with serialization
contract SerializeOptionalSmallInt {
    smallOpt: Int? as uint4;

    init() {
        self.smallOpt = null;
    }

    receive() {
        self.smallOpt = 5;
    }
}