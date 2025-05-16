struct SWithAddr {
    a: Address;
    b: Bool;
}

contract NestedAddr {
    nested: SWithAddr;
    init() {
        self.nested = SWithAddr{
            a: myAddress(),
            b: false,
        };
    }
}