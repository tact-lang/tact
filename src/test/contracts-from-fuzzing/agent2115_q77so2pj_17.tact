// Optional address field edge
contract AddrNull {
    a1: Address?;
    a2: Address?;
    init() {
        self.a1 = myAddress();
        self.a2 = null;
    }
}