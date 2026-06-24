struct MultiAddr {
    owner: Address;
    backup: Address?;
    admin: Address;
    disabled: Bool;
}

contract AddressMix {
    data: MultiAddr;

    init() {
        self.data = MultiAddr{
            owner: myAddress(),
            backup: null,
            admin: myAddress(),
            disabled: false
        };
    }
}