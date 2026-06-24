// Contract with persistent address optional
contract OptionalAddrStorage {
    addr: Address?;

    init() {
        self.addr = null;
    }
}