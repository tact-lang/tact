// Test optional address persistent field + assign null
contract OptAddr {
    addr: Address?;
    init() {
        self.addr = null;
    }
}