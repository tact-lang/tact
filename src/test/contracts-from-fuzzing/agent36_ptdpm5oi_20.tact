contract OptAddrStore {
    addr: Address?;

    init() {
        self.addr = null;
    }

    receive() {
        let _ = self.addr;
    }
}