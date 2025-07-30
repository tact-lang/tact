struct HasAddress {
    a: Address;
    ao: Address?;
}

contract AddrTest {
    x: HasAddress;

    init() {
        self.x = HasAddress{ a: myAddress(), ao: null };
    }
}