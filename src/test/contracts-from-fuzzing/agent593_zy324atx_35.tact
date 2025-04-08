// Now assign negative number to unsigned persistent Int to trigger serialization error at runtime
contract NegativeToUnsigned {
    val: Int as uint32;
    init() {
        self.val = -5;
    }
}