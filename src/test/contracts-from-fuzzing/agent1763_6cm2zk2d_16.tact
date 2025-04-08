struct OptAddr {
    addr1: Address?;
    addr2: Address?;
}

contract TestContract(v: OptAddr) {
    receive() {
        let _ = self.v;
    }
}