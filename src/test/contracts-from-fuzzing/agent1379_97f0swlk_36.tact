struct JustAddress {
    a: Address;
}

contract AddrPersistent {
    val: JustAddress;
    init() {
        self.val = JustAddress{ a: myAddress() };
    }
}
