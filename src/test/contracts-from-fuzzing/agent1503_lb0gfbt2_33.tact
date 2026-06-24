struct S {
    addr: Address;
}

contract PersistAddress {
    x: Address;
    s: S;
    init() {
        self.x = myAddress();
        self.s = S { addr: myAddress() };
    }
    receive() {}
}