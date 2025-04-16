// Optional addresses and strings in persistent state
contract TestContract {
    addr: Address?;
    s: String?;
    init() {
        self.addr = null;
        self.s = "hi";
    }
}