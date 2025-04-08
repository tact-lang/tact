struct HasAddr {
    a: Address;
    b: Address?;
}

contract Addresses {
    recs: HasAddr;

    init() {
        self.recs = HasAddr{
            a: myAddress(),
            b: null
        };
    }
}