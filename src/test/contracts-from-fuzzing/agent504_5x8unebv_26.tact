struct SAddrBool {
    a: Address;
    b: Bool;
}

contract AddrBoolFields {
    f: SAddrBool;

    init() {
        self.f = SAddrBool{ a: myAddress(), b: true };
    }

    receive() {
        let x = self.f;
    }
}